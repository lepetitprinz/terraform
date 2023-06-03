provider "aws" {
    region = var.AWS_REGION
    access_key = var.AWS_ACCESS_KEY
    secret_key = var.AWS_SECRET_KEY
}

locals {
    common_tags = {
        Owner = "DevOps Team"
        service = "backend"
    }
}

resource "aws_instance" "app-dev" {
  ami = var.AMIS["ap-northeast-2"]
  instance_type = "t2.micro"
  tags = local.common_tags
}

resource "aws_instance" "db-dev" {
    ami = var.AMIS["ap-northeast-2"]
    instance_type = "t2.small"
    tags = local.common_tags
}

resource "aws_ebs_volume" "db_ebs" {
    availability_zone = "ap-northeast-2"
    size = 8
    tags = local.common_tags
}
