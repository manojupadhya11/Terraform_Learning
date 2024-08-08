resource "aws_instance" "EC2InstanceSample" {
  ami           = " ami-0a4408457f9a03be3"
  instance_type = "t2.micro"
  count = 5

  tags = {
    Name = "Hello World"
  }
}