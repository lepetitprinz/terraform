provider "aws" {
  region = "ap-northeast-2"
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

resource "aws_instance" "my-ec2" {
    ami = "ami-03f54df9441e9b380"
    instance_type = "t2.micro"

    tags = {
        Name = "terraform-test-ec2"
    }
}