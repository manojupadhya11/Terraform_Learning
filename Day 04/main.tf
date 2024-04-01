#In this  we are going to practice remote backend and state lock in terraform

provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "ec2_example" {
    ami = "ami-007020fd9c84e18c7"
    instance_type = "t2.micro"
    subnet_id = "subnet-0703716fa2e56fa7c"
    associate_public_ip_address = true
  
}

resource "aws_s3_bucket" "s3_example" {
    bucket = "manoj-upadhya-example-bucket"  #bucket name must be unique
}

resource "aws_dynamodb_table" "terraform_lock" {
    name = "terraform_lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type = "S"
    }
}