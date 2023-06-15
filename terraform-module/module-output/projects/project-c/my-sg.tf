module "sg-module" {
    source = "../../modules/sg"
}

resource "aws_instance" "web" {
    ami = lookup(var.AMIS, var.AWS_REGION)
    instance_type = "t2.micro"
    vpc_security_group_ids = [module.sg-module.sg_id]
}

output "sg_id_output" {
    value = module.sg-module.sg_id
}