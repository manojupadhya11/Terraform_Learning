#Just created the variables in the variables.tf file, we pass value for these variables dynamically via terraform.tfvars
variable "ami_value" {
    description = "value for the ami"
}

variable "instance_type_value" {
    description = "value for instance_type"
}

variable "subnet_id_value" {
    description = "value for the subnet_id"
}