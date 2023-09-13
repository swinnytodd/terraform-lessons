
variable "region" {
  default = "eu-west-2"

}

variable "ami" {
  default = "ami-0055e70f580e9ae80"

}

variable "instance_type" {
  default = "t3.micro"

}

variable "ingress_ports" {
  type    = list(number)
  default = [80, 443]

}
