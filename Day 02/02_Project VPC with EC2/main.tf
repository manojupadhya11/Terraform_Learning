resource "aws_vpc" "my_vpc" {
    cidr_block = var.cidr
}

resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.my_vpc.vpc_id
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-south-1"
    map_public_ip_on_launch = true
}