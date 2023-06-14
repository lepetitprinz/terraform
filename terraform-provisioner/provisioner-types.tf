provider "aws" {
    region = var.AWS_REGION
    access_key = var.AWS_ACCESS_KEY
    secret_key = var.AWS_SECRET_KEY
}

resource "aws_security_group" "allow-ssh" {
    name = "allow_ssh"
    description = "Allow SSH inbound traffic"

    ingress {
        description = "SSH into VPC"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress = {
        description = "Outbound Allowed"
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "my-ec2" {
    ami = lookup(var.AMIS, var.AWS_REGION)
    instance_type = "t2.micro"
    key_name = "ec2-key"
    vpc_security_group_ids = [aws_security_group.allow-ssh.id]

    provisioner "remote-exec" {
        inline = [
            "sudo yum -y install nano"
        ]
    }

    provisioner "remote_exec" {
        when = destroy
        inline = [
            "sudo yum -y remove nano"
        ]
    }

    connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file("./ec2-key.pem")
        host = self.public_ip
    }
}