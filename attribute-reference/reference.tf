provider "aws" {
  region = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

resource "aws_instance" "attrbute-reference" {
    ami = var.AMIS["ap-northeast-2"]
    instance_type = "t2.micro"

    tags = {
        Name = "terraform-attribute-reference"
    }
}

resource "aws_eip" "lb" {
    vpc = true
}

resource "aws_eip_association" "eip_assoc" {
    instance_id = aws_instance.attrbute-reference.id
    allocation_id = aws_eip.lb.id

}

resource "aws_security_group" "allow_tls" {
    name = "terraform-security-group"
    
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = [aws_eip.lb.public_ip/32]
    }
}