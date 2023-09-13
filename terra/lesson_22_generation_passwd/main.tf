#Database!

provider "aws" {
  region = "eu-west-2"

}

resource "random_string" "rds_password" {
  length           = 12
  special          = true
  override_special = "!#$&"
}

resource "aws_ssm_parameter" "rds_password" {
  name        = "/prod/mysql"
  description = "Master Password for RDS MySQL"
  type        = "SecureString"
  value       = random_string.rds_password.result

}

data "aws_ssm_parameter" "my_rds_password" {
  name       = "/prod/mysql"
  depends_on = [aws_ssm_parameter.rds_password]


}

output "rds_password" {
  value     = data.aws_ssm_parameter.my_rds_password.value
  sensitive = true
  
  #

}

resource "aws_db_instance" "default" {
  identifier = "prod-rds"
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "mysql"
  engine_version    = "5.7"
  instance_class = "db.t2.micro"
  db_name = "prod"
  username = "root"
  password = data.aws_ssm_parameter.my_rds_password.value
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot = true
  apply_immediately = true
}