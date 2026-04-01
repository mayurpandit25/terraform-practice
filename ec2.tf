resource "aws_instance" "ec2" {
    ami = "ami-05d2d839d4f73aafb"
    instance_type = "t3.micro"
    vpc_security_group_ids = [ aws_security_group.sg.id ]
    user_data = <<-EOF
                #!/bin/bash
                apt update -y
                apt install nginx -y
                systemctl start nginx 
                systemctl enable nginx
                EOF
    tags = {
        Name = "my-server"
    }
}
