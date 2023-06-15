/*
provider "aws" {
    region = var.AWS_REGION
    access_key = var.AWS_ACCESS_KEY
    secret_key = var.AWS_SECRET_KEY
}

resource "aws_eip" "lb" {
    vpc = true
}

output "eip" {
    value = aws_eip.lb
}

resource "aws_s3_bucket" "my-s3" {
    bucket = "yjkim-attribute-test-001"
}

output "mys3bucket" {
    value = aws_s3_bucket.my-s3
}
*/