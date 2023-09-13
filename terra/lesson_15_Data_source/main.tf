#Изьятия ресурсов информации из ресурсов

provider "aws" {
    region = "eu-west-1"
  
}

data "aws_availability_zones" "working" {}
output "data_aws_availability_zones" {
    value = data.aws_availability_zones.working.names[1]
  
}


data "aws_caller_identity" "curent" {}
output "data_aws_caller_identity" {
    value = data.aws_caller_identity.curent.account_id
}

data "aws_region" "curent" {}
output "data_aws_region_name" {
    value = data.aws_region.curent.name
  
}
output "data_aws_region_description" {
    value = data.aws_region.curent.description
}

data "aws_vpcs" "curent" {}
output "data_aws_vpcs" {
    value = data.aws_vpcs.curent.ids
  
}

data "aws_vpc" "prod_vpc" {
    tags = {
      Name = "prod"
    }
  
}
output "data_aws_vpc" {
    value = data.aws_vpc.prod_vpc.id
  
}
