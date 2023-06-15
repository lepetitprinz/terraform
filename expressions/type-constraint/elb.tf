provider "aws" {
  region = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

resource "aws_elb" "bar" {
    name = var.AWS_ELB_NAME
    availability_zones = var.AWS_AZ

    listener {
      instance_port = 8000
      instance_protocol = "http"
      lb_port = 80
      lb_protocol = "http" 
    }

    health_check {
      healthy_threshold = 2
      unhealthy_threshold = 2
      timeout = var.AWS_HEALTH_CHECK_TIMEOUT
      target = "HTTP:8000/"
      interval = 30
    }
    
}