provider "aws" {
    region = "ap-south-1"
}
variable "ami" {
    description = "This is AMI id"
}
variable "instance_type" {
    description = "Instance type " 
}
resource "aws_instance" "example" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = "subnet-0703716fa2e56fa7c"
}