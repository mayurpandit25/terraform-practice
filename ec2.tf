resource "aws_instance" "ec2" {
    ami = "ami-05d2d839d4f73aafb"
    instance_type = "t3.micro"
    key_name = "ubuntu"
    vpc_security_group_ids = [ aws_security_group.sg.id ]
    user_data = file("./user_data.sh")
    count = 2

    root_block_device {
      volume_size = 10
      volume_type = "gp3"
    }

    tags = {
        Name = "my-server"
    }
}
