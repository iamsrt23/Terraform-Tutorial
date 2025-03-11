resource "aws_vpc" "module_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_tag
    Owner = local.Owner
    CostCenter = local.CostCenter
    TamDL = local.TamDL
    environment = var.environment
  }
  
}



resource "aws_internet_gateway" "module-IGW" {
  vpc_id = aws_vpc.module_vpc.id
  tags = {
    Name = "${var.vpc_tag}-IGW"
    Owner=local.Owner
    CostCenter= local.CostCenter
    TamDL = local.TamDL
    environment = var.environment
  }
  
}