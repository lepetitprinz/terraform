provider "aws" {
  region = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

resource "aws_instance" "count-ec2" {
  ami = var.AMIS["ap-northeast-2"]
  instance_type = "t2.micro"
  count = 3
}