provider "aws" {
  region     = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

resource "aws_iam_user" "iam" {
  for_each = toset(["user-01", "user-02", "user-03"])
  name     = each.key
}

resource "aws_instance" "ec2" {
  ami = lookup(var.AMIS, var.AWS_REGION)
  for_each = {
    t2-micro = "t2.micro"
    t2-medium = "t2.medium"
  }
  instance_type = each.value
  key_name      = each.key
  tags = {
    Name = each.value
  }
}