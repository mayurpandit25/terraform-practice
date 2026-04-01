resource "aws_vpc" "my_vpc" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = "my_vpc"
    }  
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.public_subnet_cidr
    availability_zone = var.public_az
    tags = {
        Name = "public_subnet"
    }
    map_public_ip_on_launch = true 
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.my_vpc.id 
    cidr_block = var.private_subnet_cidr
    availability_zone = var.private_az
    tags = {
        Name = "private_subnet"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.my_vpc.id 
    tags   = {
        Name = "igw"
    }
}

resource "aws_eip" "nat_eip" {
    domain = "vpc"
    tags = {
        Name = "nat_eip"
    }
}

resource "aws_nat_gateway" "nat" {
    subnet_id = aws_subnet.public_subnet.id 
    allocation_id = aws_eip.nat_eip.id 
    
    tags = {
        Name = "nat"
    }
}

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.my_vpc.id 

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id 
    }

    tags = {
        Name = "public_rt"
    }
}

resource "aws_route_table_association" "public_rt_assoc" {
    route_table_id = aws_route_table.public_rt.id 
    subnet_id = aws_subnet.public_subnet.id   
}

resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.my_vpc.id 

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat.id 
    }

    tags = {
        Name = "private_rt"
    }
}

resource "aws_route_table_association" "private_rt_assoc" {
    subnet_id = aws_subnet.private_subnet.id 
    route_table_id = aws_route_table.private_rt.id 
}

resource "aws_instance" "bastion_host_server" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = aws_subnet.public_subnet.id
    vpc_security_group_ids = [ aws_security_group.sg.id ]
    depends_on = [ aws_security_group.sg ]
    user_data = file("/root/terraform-practice/user_data.sh")
    tags = {
        Name = "bastion_host_server"
    }
}

resource "aws_instance" "private_server" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name 
    subnet_id = aws_subnet.private_subnet.id 
    vpc_security_group_ids = [ aws_security_group.sg.id ]
    depends_on = [ aws_security_group.sg ]
    user_data = file("/root/terraform-practice/user_data.sh")
    tags = {
        Name = "private_server"
    }
}
