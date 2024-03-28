terraform {
  required_providers {
    source = "hashicorp/aws"
    version = "5.11.0"
  }
}

provider "aws" {
    #configuration options
    region = "ap-south-1"
  
}