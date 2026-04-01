resource "aws_instance" "ec2" {
   for_each = tomap({
    server1 = "t3.micro"
    server2 = "t3.small"
   })

    ami = "ami-05d2d839d4f73aafb"
    instance_type = each.value
    key_name = "ubuntu"
    vpc_security_group_ids = [ aws_security_group.sg.id ]
    user_data = file("./user_data.sh")
    #count = 2
    depends_on = [ aws_security_group.sg ]

    root_block_device {
      volume_size = var.env == "prod" ? 30 : var.volume_size
      volume_type = var.env == "dev" ? "gp3" : var.volume_type
    }

    tags = {
        Name = each.key
    }
}
