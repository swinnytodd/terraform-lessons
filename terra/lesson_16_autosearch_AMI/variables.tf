variable "region" {
  default = "eu-west-2"

}

variable "latest_ubuntu_ami_name" {
  description = "Latest Ubuntu"
  default     = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"

}

variable "latest_amazon_linux" {
  description = "Latest Amazon linux"
  default     = "amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"

}

