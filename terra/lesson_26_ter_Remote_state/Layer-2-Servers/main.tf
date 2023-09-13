provider "aws" {
    region = "eu-west-2"
  
}


terraform {
  backend "s3" {
    bucket = "amantur-dzahamankulov-terraform-state"
    key = "dev/servers/terraform.tfstate"
    region = "eu-west-2"
    
  }

}

data "terraform_remote_state" "network" {
    backend = "s3"
    config = {
    bucket = "amantur-dzahamankulov-terraform-state"
    key = "dev/network/terraform.tfstate"
    region = "eu-west-2"
    }
  
}

data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
#===============================================================


resource "aws_instance" "web_server" {
  ami                    = data.aws_ami.latest_amazon_linux.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.webserver.id]
  subnet_id              = data.terraform_remote_state.network.outputs.public_subnet_ids[0]
  user_data              = <<EOF
#!/bin/bash
yum -y update
yum -y install httpd
myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h2>WebServer with IP: $myip</h2><br>Build by Terraform with Remote State Dzhanakulov Amantur"  >  /var/www/html/index.html
sudo service httpd start
chkconfig httpd on
EOF
  tags = {
    Name = "${var.env}-WebServer"
  }
}

resource "aws_security_group" "webserver" {
  name = "WebServer Security Group"
  vpc_id = data.terraform_remote_state.network.outputs.vpc_id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [data.terraform_remote_state.network.outputs.vpc_cidr]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-web-server-sg"
    Owner = "Dzhamankulov Amantur"
  }
}

#=================================================================