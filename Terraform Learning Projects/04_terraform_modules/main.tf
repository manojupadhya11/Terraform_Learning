provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
    source  = "./modules/ec2_instance"
    ami_value =  "ami-007020fd9c84e18c7"
    instance_type_value =  "t2.micro"
}