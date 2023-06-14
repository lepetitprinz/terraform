provider "aws" {
    region = var.AWS_REGION
    access_key = var.AWS_ACCESS_KEY
    secret_key = var.AWS_SECRET_KEY
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "myec2" {
   ami = lookup(var.AMIS, var.AWS_REGION)
   instance_type = "t2.micro"
   key_name = "ec2-key"
   vpc_security_group_ids  = [aws_security_group.allow_ssh.id]

   provisioner "remote-exec" {
     on_failure = continue
     inline = [
       "sudo yum -y install nano"
     ]
   }
   connection {
     type = "ssh"
     user = "ec2-user"
     private_key = file("./ec2-key.pem")
     host = self.public_ip
   }
}