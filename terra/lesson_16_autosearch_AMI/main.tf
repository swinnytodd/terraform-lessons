provider "aws" {
  region = var.region
}

data "aws_ami" "latest_ubuntu" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = [var.latest_ubuntu_ami_name]
  }

}

data "aws_ami" "amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = [var.latest_amazon_linux]
  }

}

resource "aws_instance" "my_webserver_ubuntu" {
  ami = data.aws_ami.latest_ubuntu.id
  instance_type = "t3.micro"
  
}

resource "aws_instance" "my_webserver_amazon" {
  ami = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  
}