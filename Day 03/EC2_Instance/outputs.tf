#Using output functionality of terraform to display the public ip address
output "public_ip" {
  value = aws_instance.module_example_instance.public_ip
}