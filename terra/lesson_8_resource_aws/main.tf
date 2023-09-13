provider "aws" {
  region = var.region
}

resource "aws_instance" "amazon_linux" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.server.id]
  #     user_data = <<EOF
  # #!/bin/bash
  # yum -y update
  # yum -y install httpd


  # EOF  
}

resource "aws_security_group" "server" {
  name        = "WebServer security group"
  description = "security group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}