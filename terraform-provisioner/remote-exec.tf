provider "aws" {
    region = var.AWS_REGION
    access_key = var.AWS_ACCESS_KEY
    secret_key = var.AWS_SECRET_KEY
}

resource "aws_instance" "my-ec2" {
    ami = lookup(var.AMIS, var.AWS_REGION)
    instance_type = "t2.micro"
    key_name = "terraform-key"

    connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file("./terraform-key.pem")
        host = self.public_ip
    }

    provisioner "remote-exec" {
        inline = [
            "sudo amazon-linux-extras install -y nginx1",
            "sudo systemctl start nginx"
        ]
    }
}