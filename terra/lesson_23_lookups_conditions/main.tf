provider "aws" {
  region = "eu-west-2"
}

variable "env" {
  default = "dev" #"dev" #"prod"

}

variable "prod_owner" {
  default = "dzhamankulov amantur"

}
variable "noprod_owner" {
  default = "swinnytodd"

}

variable "allow_port_list" {
    default = {
        "prod" = ["80", "443"]
        "dev" = ["80", "443", "8080", "22"]
    }
  
}


resource "aws_instance" "my_webserver" {
  ami           = "ami-0a242269c4b530c5e"
  instance_type = (var.env == "prod" ? "t3.micro" : "t2.micro")

  tags = {
    Name  = "${var.env}-server"
    Owner = var.env == "prod" ? var.prod_owner : var.noprod_owner

  }

}

resource "aws_instance" "my_dev_server" {
  count = var.env == "dev" ? 1 : 0

  ami           = "ami-0a242269c4b530c5e"
  instance_type = "t2.micro"

  tags = {
    Name  = "Bastion Server for Dev-server"
    Owner = var.env == "prod" ? var.prod_owner : var.noprod_owner

  }

}

 



# output "instance_type" {
#   value = aws_instance.my_dev_server[0].instance_type

# }
 