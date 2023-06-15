resource "aws_instance" "myec2" {
  ami = lookup(var.AMIS, var.AWS_REGION)
  instance_type = var.INSTANCE_TYPE
}