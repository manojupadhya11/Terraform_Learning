provider "aws" {
  region = "ap-south-1"
}

variable "ami" {
  description = "value"
}

variable "instance_type" {
  description = "value"
  type = map(string)

  default = {
    "dev" = "t2.micro"
    "stage" = "t2.medium"
    "prod" = "t2.xlarge"
  }
}
# variable "instance_type" {
#     description = "Instance type " 
# }
module "ec2_instance" {
  source = "./modules/EC2 Instance"
  ami = var.ami
  # instance_type = var.instance_type
  instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
}