resource "aws_instance" "bastion_host_server" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = var.public_subnet_id
    vpc_security_group_ids = [ var.sg_id ]
    user_data = file("/root/terraform-practice/module/ec2/user_data.sh")
    tags = {
        Name = "bastion_host_server"
    }
}

resource "aws_instance" "private_server" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name 
    subnet_id = var.private_subnet_id
    vpc_security_group_ids = [ var.sg_id ]
    user_data = file("/root/terraform-practice/module/ec2/user_data.sh")
    tags = {
        Name = "private_server"
    }
}
