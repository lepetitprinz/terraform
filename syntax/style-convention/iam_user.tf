resource "aws_iam_user" "lb" {
  name = var.AWS_IAM_USER
  path = "/system/"
}