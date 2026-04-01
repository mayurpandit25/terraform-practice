/* output "vpc_id" {
    value = aws_vpc.my_vpc.id 
}

output "public_subnet_id" {
    value = aws_subnet.public_subnet.id 
}

output "private_subnet_id" {
    value = aws_subnet.private_subnet.id 
}

output "public_instance_ip" {
    value = aws_instance.bastion_host_server.public_ip
}

output "private_instance_ip" {
    value = aws_instance.private_server.private_ip
}

 */

/* output "public_instance_ip" {
    value = module.ec2.public_instance_ip
}

output "private_instance_ip" {
    value = module.ec2.private_instance_ip
}

output "sg_id" {
    value = module.sg.sg_id
}

output "public_subnet_id" {
    value = module.vpc.public_subnet_id
}

output "private_subnet_id" {
    value = module.vpc.private_subnet_id
}

output "vpc_id" {
    value = module.vpc.vpc_id
}
 */
