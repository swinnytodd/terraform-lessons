variable "aws_region" {
  description = "The region where AWS resources will be created"
  default     = "eu-west-2"
}

variable "aws_instance_type" {
  description = "The type of instance to launch"
  default     = "t2.micro"
}

variable "ami" {
  default = "ami-09ee0944866c73f62"

}

variable "allowed_ports" {
  type        = list(number)
  description = "List of allowed ports for the Ansible security group"
  default     = [80, 443, 22, 8080]
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to apply to the AWS resources"
  default = {
    Name  = "My SecurityGroup Amazon"
    Owner = "Dzhamankulov"
  }
}

