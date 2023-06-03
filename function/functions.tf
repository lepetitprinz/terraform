provider "aws" {
    region = var.AWS_REGION
    access_key = var.AWS_ACCESS_KEY
    secret_key = var.AWS_SECRET_KEY
}

locals = {
    time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

resource "aws_key_pair" "login_key" {
    key_name = "login-key"
    public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "app-dev" {
    ami = lookup(var.AMIS, var.AWS_REGION)
    instance_type = "t2.micro"
    key_name = aws_key_pair.login_key.key_name
    count = 2

    tags = {
        Name = element(var.TAGS, count.index)
    }
}

output "timestamp" {
    value = local.time
}