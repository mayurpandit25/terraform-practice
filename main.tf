module "vpc" {
    source = "./module/vpc"
    vpc_cidr = "10.0.0.0/16"
    public_subnet_cidr = "10.0.0.0/20"
    private_subnet_cidr = "10.0.16.0/20"
    public_az = "ap-south-1a"
    private_az = "ap-south-1b"
  
}

module "sg" {
    source = "./module/sg"
    name   = "my-security-group"
    vpc_id = module.vpc.vpc_id
    ingress_http = 80
    ingress_ssh = 22  
}

module "ec2" {
    source = "./module/ec2"
    ami    = "ami-08251ad549dc5db38"
    instance_type = "t3.micro"
    key_name = "ubuntu"
    public_subnet_id = module.vpc.public_subnet_id
    private_subnet_id = module.vpc.private_subnet_id
    sg_id = module.sg.sg_id
}

