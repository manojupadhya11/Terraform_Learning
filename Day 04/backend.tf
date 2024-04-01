terraform {
  backend "s3" {
    bucket = "manoj-upadhya-example-bucket"
    key = "manoj/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    dynamodb_table = "terraform_lock"
    
  }
}