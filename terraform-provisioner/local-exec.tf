provider "aws" {
    region = var.AWS_REGION
    access_key = var.AWS_ACCESS_KEY
    secret_key = var.AWS_SECRET_KEY
}

resource "aws_instance" "my-ec2" {
    ami = lookup(var.AMIS, var.AWS_REGION)
    instance_type = "t2.micro"
    
    provisioner "local-exec" {
      comamnd = "echo ${aws_instance.my-ec2.private_ip} >> private_ips.txt"
    }
}