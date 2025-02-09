terraform{
    required_providers  {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
}

provider "aws" {
    region = "ap-south-1a"
}