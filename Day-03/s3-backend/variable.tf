variable "region" {}
variable "vpc_cidr_block" {}
variable "vpc_tag" {}
variable "public_1_cidrblock" {}
variable "public_2_cidrblock" {}
variable "public_3_cidrblock" {}
variable "az_1" {}
variable "public_subnet_1_tag" {}
variable "public_subnet_2_tag" {}
variable "public_subnet_3_tag" {}
variable "environment" { default = "dev" }
variable "igw_tag" {}
variable "rt_cidr_block" {}
variable "route_table_tag" {}
variable "ec2_az" {}

variable "env" {}

variable "key_name" {}
# variable "instance_type" {
#   type = map(string)
#   default = {
#     dev  = "t2.nano"
#     test = "t2.micro"
#     prod = "t2.medium"
#   }
# }
  