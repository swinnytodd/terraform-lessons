#25-Создание ресурсов в нескольких aws regions/accounts

provider "aws" {
    region = "eu-west-2"
  
}
provider "aws" {
    region = "eu-west-1"
    alias = "ireland"
  
}

provider "aws" {
    region = "eu-central-1"
    alias = "frankfurt"
  
}
#==============================================================
data "aws_ami" "frankfurt_latest_ami" {
    provider = aws.frankfurt
    owners = ["099720109477"]
    most_recent = true
    filter {
      name = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
    }
  
}

resource "aws_instance" "london_server" {
    instance_type = "t3.micro"
    ami = "ami-0a242269c4b530c5e"
    tags = {
      Name = "London Server"
    }
}

resource "aws_instance" "ireland_server" {
    provider = aws.ireland #alias
    instance_type = "t3.micro"
    ami = "ami-0a242269c4b530c5e"
    tags = {
      Name = "Ireland Server"
    }
}

resource "aws_instance" "frankfurt_server" {
    provider = aws.frankfurt
    instance_type = "t3.micro"
    ami = data.aws_ami.frankfurt_latest_ami.id
    tags = {
      Name = "Frankfurt server"
    }
  
}

