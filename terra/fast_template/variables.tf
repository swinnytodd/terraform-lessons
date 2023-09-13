variable "aws_region" {
  description = "The region where AWS resources will be created"
  default     = "eu-west-2"
}

variable "aws_instance_type" {
  description = "The type of instance to launch"
  default     = "t2.micro"
}


variable "ansible_security_group_name" {
  description = "The name of the Ansible security group"
  default     = "Security Group Ansible"
}

variable "allowed_ports" {
  type        = list(number)
  description = "List of allowed ports for the Ansible security group"
  default     = [80, 443, 22, 8080]
}
