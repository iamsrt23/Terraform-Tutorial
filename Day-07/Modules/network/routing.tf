resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.module_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.module-IGW.id
  }
  
}



resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.module_vpc.id
  
  tags = {
    Name = "${var.vpc_tag}-PrivateRT"
    Owner = local.Owner
    CostCenter = local.CostCenter
    TamDL = local.TamDL
    environment = var.environment
  }
  
}

resource "aws_route_table_association" "public-RTA" {
  count = length(var.public_cidr)
  subnet_id = element(aws_subnet.public-subnets.*.id,count.index)
  route_table_id = aws_route_table.public_route_table.id
  
}


resource "aws_route_table_association" "private-RTA" {
  count = length(var.private_cidr)
  subnet_id = element(aws_subnet.private-subnets.*.id,count.index)
  route_table_id = aws_route_table.public_route_table.id
  
}