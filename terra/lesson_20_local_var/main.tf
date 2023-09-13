provider "aws" {
  region = "eu-west-2"
}

locals {
  full_project_name = "${var.environment}-${var.project_name}"
  project_owner     = "${var.owner} owner of ${var.project_name}"
}

data "aws_region" "current" {}
data "aws_availability_zones" "available" {}

locals {

  country  = "Kyrgyzstan"
  city     = "Bishkek"
  az_list  = join(",", data.aws_availability_zones.available.names)
  location = local.az_list
}




resource "aws_eip" "my_static_ip" {
  tags = {
    Name          = "Static IP"
    Owner         = var.owner
    Project       = local.full_project_name
    project_owner = local.project_owner
    proj_owner    = local.project_owner
    city          = local.city

  }

}