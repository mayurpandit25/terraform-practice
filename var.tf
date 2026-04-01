/* variable "vpc_cidr" {
    type = string 
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    type = string 
    default = "10.0.0.0/20"
}

variable "private_subnet_cidr" {
    type = string 
    default = "10.0.16.0/20"
}

variable "public_az" {
    type = string 
    default = "ap-south-1a"
}

variable "private_az" {
    type = string 
    default = "ap-south-1b"  
}

variable "ami" {
    type = string
    default = "ami-05d2d839d4f73aafb"
}

variable "instance_type" {
    type = string 
    default = "t3.micro"
}

variable "key_name" {
    type = string 
    default = "ubuntu"
}

variable "volume_size" {
    default = 20  
}

variable "volume_type" {
    default = "gp3"
}

variable "env" {
    default = "dev"
}

*/

variable "vpc_cidr" {}
variable "public_subnet_cidr" {}
variable "public_az" {}
variable "private_subnet_cidr" {}
variable "private_az" {}

variable "name" {}
variable "ingress_http" {}
variable "ingress_ssh" {}

variable "ami" {}
variable "instance_type" {}
variable "key_name" {}
