variable "ami_value" {
    description = "value for ami id"
  
}
variable "instance_type" {
    description = "value for instance type"
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "test_server" {
    ami = var.ami_value
    instance_type = var.instance_type

}

output "public_ip" {
    value = aws_instance.test_server.public_ip
}

