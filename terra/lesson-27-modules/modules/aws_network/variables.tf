

variable "vpc_cidr" {
    default = "10.0.0.0/0"
}

variable "env" {
    default = "env"
}

variable "public_subnets_cidrs" {
    default = [
        "10.0.1.0/24",
        "10.0.2.0/24",
        "10.0.3.0/24"
    ]
}

variable "private_subnet_cidrs" {
    default = [
        "10.0.11.0/24",
        "10.0.22.0/24",
        "10.0.33.0/24"
    ]
}
