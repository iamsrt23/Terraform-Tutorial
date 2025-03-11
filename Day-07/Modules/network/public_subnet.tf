resource "aws_subnet" "public-subnets" {
  count = length(var.public_cidr)
  vpc_id = aws_vpc.module_vpc.id
  cidr_block = element(var.public_cidr,count.index)
  availability_zone = element(var.azs,count.index)
  tags = {
    Name = "${var.vpc_tag}-public_subnet-${count.index+1}"
    Owner = local.Owner
    CostCenter=local.CostCenter
    TamDL = local.TamDL
    environment=var.environment
  }
}