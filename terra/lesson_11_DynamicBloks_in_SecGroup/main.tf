
provider "aws" {
  region = "eu-west-1"

}


resource "aws_security_group" "example" {
  name        = "Example Security Group"
  description = "example"


  dynamic "ingress" {
    for_each = ["80", "443", "1541", "8080"]

    content {
      from_port  = ingress.value
      to_port    = ingress.value
      protocol   = "tcp"
      cidr_block = ["0.0.0.0/0"]
    }

  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.10.0.0/16"]
  }



  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "example"
  }

}