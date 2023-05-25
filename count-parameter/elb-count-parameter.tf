provider "aws" {
  region = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

variable "ELB_NAMES" {
    type = list(string)
    default = ["dev_lb", "stage_lb", "prod-lb"]
}

resource "aws_elb" "lb" {
    name = var.ELB_NAMES[count.index]
    count = 3
}