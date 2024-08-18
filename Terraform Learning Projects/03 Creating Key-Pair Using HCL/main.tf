#Terrafrom code to launch  an EC2 Instance
resource "aws_instance" "Terraform_Practice" {
    ami           = "ami-0a4408457f9a03be3"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.WebSG.name]
  tags = {
    Name = "EC2-Sample-Instance"
  }
}

#Terraform code to create Security Group
resource "aws_security_group" "WebSG" {
    description = "Security group using Terraform"
    name = "Security group using Terraform"
    vpc_id =  "vpc-08b883ca5c8e612d5"

    ingress {
        description = "HTTPS"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    ingress {
        description = "HTTPS"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol= "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "WebSG"

    }
  
}

#Terraform code to create key pair using HCL
resource "aws_key_pair" "TF_key" {
    key_name   = "TF_key"
    public_key = tls_private_key.rsa.public_key_openssh
}
  
resource "tls_private_key" "rsa" {
    algorithm = "RSA"
    rsa_bits = 4096
  
}

resource "local_file" "TF_key" {
    content = tls_private_key.rsa.private_key_pem
    filename = "tfkey" 
}