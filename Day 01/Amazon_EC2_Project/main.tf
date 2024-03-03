provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_instance" "Terraform_Example" {
    ami = "ami-0e670eb768a5fc3d4"
    instance_type = "t2.micro"
    subnet_id = ""
    key_name = "Manu_Key_2"
  
}