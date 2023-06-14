provider "aws" {
  region     = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

resource "aws_eip" "lb" {
  vpc      = true
  count = 1
}

resource "null_resource" "ip_check" {
    # Replacement of any instance of the cluster requires re-provisioning
    triggers_replace = {
        latest_ips = join(",", aws_eip.lb[*].public_ip)
    }

    provisioner "local-exec" {
        command = "echo Latest IPs are ${null_resource.ip_check.triggers.latest_ips} > latest_ips.txt"
    }
}