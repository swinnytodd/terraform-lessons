# terrafrom auto fill
#File can be name as:
#terrafrom.tfvars

region        = "eu-west-1"
instance_type = "t2.micro"

allow_ports = ["80", "22", "443"]

common_tags = {
  Name        = "Dzhamankulov Amantur"
  Owner       = "Amantur"
  Project     = "Terrafrom_learning"
  Environment = "dev"
}