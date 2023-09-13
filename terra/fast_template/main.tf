provider "aws" {
  region = var.aws_region
}

resource "aws_default_vpc" "default" {}

resource "aws_instance" "my_server_web" {
  ami                    = "ami-0aaa5410833273cfe"
  instance_type          = var.aws_instance_type
  key_name               = "aws_key"
  vpc_security_group_ids = [aws_security_group.ansible_test.id]
#   user_data              = file("user_data.sh")

  tags = {
    Name = "Ansible-Test"
  }
}

resource "aws_security_group" "ansible_test" {
  name   = var.ansible_security_group_name
  vpc_id = aws_default_vpc.default.id

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

  tags = {
    Name = "My SecurityGroup Ansible"
  }
}
