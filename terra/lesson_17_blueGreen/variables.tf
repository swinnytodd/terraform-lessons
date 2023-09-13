variable "owners" {
  description = "List of AMI owners"
  type        = list(string)
  default     = ["amazon"]
}


variable "name_filter_values" {
  description = "List of name filter values for AMI search"
  type        = list(string)
  default     = ["amzn2-ami-hvm-*-x86_64-gp2"]
}

# variable "vpc_id" {
#   description = "ID of the VPC where the security group will be created"
# }

variable "ingress_ports" {
  description = "List of ingress ports to open"
  type        = list(number)
  default     = [80, 443]
}

variable "cidr_blocks" {
  description = "List of CIDR blocks to allow ingress traffic from"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "security_group_name" {
  description = "Name of the security group"
  default     = "Dynamic Security Group"
}

variable "security_group_tags" {
  description = "Map of tags to apply to the security group"
  type        = map(string)
  default     = {
    Name  = "Dynamic SecurityGroup"
    Owner = "Denis Astahov"
  }
}