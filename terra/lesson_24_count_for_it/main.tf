provider "aws" {
    region = "eu-west-2"
  
}

resource "aws_iam_user" "swinnytodd" {
    name = "swinnytodd"
  
}

variable "aws_users" {
    description = "List of IAM Users to create"
    default = ["Mira", "swinnytodd", "Liya"]

}

resource "aws_iam_user" "users" {
    count = length(var.aws_users)
    name = element(var.aws_users, count.index)
  
}
output "created_iam_users_all" {
    value = aws_iam_user.users
  
}

output "created_iam_users_id" {
    value = aws_iam_user.users[*].id
  
}

output "created_iam_users_costum" {
    value = [
        for i in aws_iam_user.users :
        " Zdorovo Username: ${i.name} has ARN: ${i.arn}"
    ]
  
}

resource "aws_instance" "servers" {
    count = 3
    ami = "ami-0a242269c4b530c5e"
    instance_type = "t3.micro"
    tags = {
      Name = "Server Number ${count.index + 1}"
    }
}

output "aws_instance_ami" {
    value = aws_instance.servers[*].tags
  
}

