#This is the project created to showcase the usage of variables in Terraform

#Defining an input variables for EC2 instance Type

variable "instance_type" {
    description = "EC2 Instance type"
    type = string
    default = "t2.micro"
  
}
#Defining an input variable for the EC2 instance AMI ID
variable "ami_id" {
    description = "EC2 AMI ID"
    type = string
    default = "ami-05295b6e6c790593e"  
}

variable "subnet_id" {
    description = "Subnet ID"
    type = string
    default = "subnet-09b31bc889cec3842"
}

variable "key_name" {
    description = "Key Name"
    type = string
    default = "Manu_Key_2"
  
}
#Configure the aws provider using the input variables
provider "aws" {
    region = "ap-south-1"
  
}

#Create an EC2 instance using the defined input variables

resource "aws_instance" "variables_Example" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    key_name = var.key_name 
}

#Definingan otput variable to expose the public ip address of created EC2 Instance
output "public_ip" {
  description = "Public IP Address of Created EC2 instance"
  value = aws_instance.variables_Example.public_ip    
}