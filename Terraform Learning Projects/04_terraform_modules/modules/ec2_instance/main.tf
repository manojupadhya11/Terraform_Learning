#Provider block code
provider "aws" {
    region = "ap-south-1"
}

#Creating resource
resource "aws_instance" "module_example_instance" {
    ami = var.ami_value 
    instance_type = var.instance_type_value
    associate_public_ip_address = true
}