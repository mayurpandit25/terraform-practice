data "aws_vpc" "default" {
    default = true 
}

resource "aws_security_group" "sg" {
    name = "my-security-group"
    description = "my-security-group"
    vpc_id  = data.aws_vpc.default.id  

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
    tags = {
        Name = "my-security-group"
    }
}