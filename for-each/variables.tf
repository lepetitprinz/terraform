variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {}

variable "AMIS" {
  type = map(string)
  default = {
    ap-northeast-2 = "ami-0a82adabc3c8d2a98"
  }
}

variable "AWS_IAM_USER" {
  default = "demo-user"
}