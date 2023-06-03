terraform {
  required_version = "> 0.11"
  required_providers {
    aws = "> 4.0"
  }
}

provider "aws" {
  region = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

resource "aws_instance" "ec2" {
  ami = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
}