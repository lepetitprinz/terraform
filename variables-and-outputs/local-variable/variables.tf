variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {}

variable "AMIS" {
  type = map(string)
  default = {
    ap-northeast-2 = "ami-03f54df9441e9b380"
  }
}

variable "IS_TEST" {}