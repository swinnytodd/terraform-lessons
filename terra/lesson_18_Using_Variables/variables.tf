variable "region" {
  default = "eu-west-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ami_name_filter" {
  default = "amzn2-ami-hvm-*-x86_64-gp2"
}

variable "eip_tags" {
  default = {
    Name    = "server ip"
    Owner   = "Dzhamankulov Amantur"
    Project = "Zahar"
  }
}

variable "common_tags" {
  default = {
    Name    = "Server build by Terraform"
    Owner   = "Dzhamankulov Amantur"
    Project = "Zahar"
  }
}

variable "ingress_ports" {
  default = ["80", "443", "22"]
}