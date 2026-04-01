resource "aws_instance" "ec2" {
    ami = "ami-05d2d839d4f73aafb"
    instance_type = "t3.micro"
    tags = {
        Name = "my-server"
    }
}
