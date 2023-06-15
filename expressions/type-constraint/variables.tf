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

variable "AWS_USER_NUMBER" {
  type = string
}

variable "AWS_ELB_NAME" {
  description = "The name of the Elastic Load Balancer"
  type = string
}

variable "AWS_AZ" {
  description = "Availability Zones"
  type = list(string)
}

variable "AWS_HEALTH_CHECK_TIMEOUT" {
  description = "Health check timeout of ELB"
  type = number
  default = 60
}
