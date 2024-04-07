provider "aws" {
    region = "ap-south-1"
}


provider "vault" {
  address = "http://13.233.139.162:8200"
  skip_child_token = true

#Authentication 
  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "92f27147-8ac6-073b-5648-7282a8b0737f"
      secret_id = "b5a56a78-aaf0-291e-93fe-4f7cd260d99c"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv"
  name  = "test-secret"
}

resource "aws_instance" "my_instance" {
  ami           = "ami-09298640a92b2d12c"
  instance_type = "t2.micro"
  subnet_id = "subnet-02c1a0a9b06333314"

  tags = {
    Name = "test"
    Secret = data.vault_kv_secret_v2.example.data["username"]
  }
}