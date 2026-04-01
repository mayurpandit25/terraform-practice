/* module "vpc" {
    source = "./module/vpc"
    vpc_cidr = var.vpc_cidr
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    public_az = var.public_az
    private_az = var.private_az
  
}

module "sg" {
    source = "./module/sg"
    name   = var.name
    vpc_id = module.vpc.vpc_id
    ingress_http = var.ingress_http
    ingress_ssh = var.ingress_ssh
}

module "ec2" {
    source = "./module/ec2"
    ami    = var.ami 
    instance_type = var.instance_type
    key_name = var.key_name
    public_subnet_id = module.vpc.public_subnet_id
    private_subnet_id = module.vpc.private_subnet_id
    sg_id = module.sg.sg_id
}

 */