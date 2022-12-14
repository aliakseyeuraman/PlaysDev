variable "aws_region" {}
variable "aws_key_name" {}
variable "public_az" {}
variable "private_az" {}
variable "passwordRDS" {}
variable "userRDS" {}
variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "172.20.0.0/16"
}

variable "vpc_cidr_public" {
    description = "CIDR for the Public subnet"
    default = "172.20.0.0/24"
}

variable "vpc_cidr_private" {
    description = "CIDR for the Private subnet"
    default = "172.20.1.0/24"
}

variable "vpc_cidr_RDS" {
    description = "CIDR for the Private subnet"
    default = "172.20.2.0/24"
}