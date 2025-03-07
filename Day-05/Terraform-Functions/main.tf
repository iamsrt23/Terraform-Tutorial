# cloud Provider
provider "aws" {
  region = var.region

}

terraform {
  backend "s3" {
    bucket = "workspace250306"
    key    = "workspace.tfstate"
    region = "us-east-1"

  }
}

# Creating VPC
resource "aws_vpc" "Functions-vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = "true"

  tags = {
    Name       = var.vpc_tag
    Owner      = local.Owner
    CostCenter = local.CostCenter
    TamDL      = local.TamDL

    environment = var.environment
  }

}


#IGW
resource "aws_internet_gateway" "Functions-IGW" {
  vpc_id = aws_vpc.Functions-vpc.id

  tags = {
    Name       = var.vpc_tag
    Owner      = local.Owner
    CostCenter = local.CostCenter
    TamDL      = local.TamDL

    environment = var.environment

  }

}







