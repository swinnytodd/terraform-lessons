
provider "aws" {
  region = var.aws_region

}

resource "aws_default_vpc" "default" {}

resource "aws_instance" "amazon" {
  ami                    = var.ami
  instance_type          = var.aws_instance_type
  vpc_security_group_ids = [aws_security_group.amazon_security_group.id]
  user_data              = templatefile("user_data.sh.tpl",{
    server_name = "web-01",
    server_role = "web-server"
  })

  tags = {
    Name = "Amazon-Test"
  }

}

resource "aws_security_group" "amazon_security_group" {


  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

