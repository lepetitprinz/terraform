provider "aws" {
    region = var.AWS_REGION
    access_key = var.AWS_ACCESS_KEY
    secret_key = var.AWS_SECRET_KEY
}

resource "aws_instance" "dev" {
  ami = var.AMIS["ap-northeast-2"]
  instance_type = "t2.micro"
  count = var.IS_TEST == true ? 1 : 0
}

resource "aws_instance" "prod" {
    ami = var.AMIS["ap-northeast-2"]
    instance_type = "t2.large"
    count = var.IS_TEST == false ? 1 : 0
}