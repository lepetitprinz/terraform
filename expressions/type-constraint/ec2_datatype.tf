
provider "aws" {
  region = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

resource "aws_iam_user" "iam-user" {
    name = var.AWS_USER_NUMBER
    path = "/system/"
}