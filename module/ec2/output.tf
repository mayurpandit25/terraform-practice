output "public_instance_ip" {
    value = aws_instance.bastion_host_server.public_ip
}

output "private_instance_ip" {
    value = aws_instance.private_server.private_ip
}

