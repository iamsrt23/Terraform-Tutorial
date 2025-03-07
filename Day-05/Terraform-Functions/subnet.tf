#Subnets
resource "aws_subnet" "public-subnets" {
  count = 3 #012

  vpc_id                  = aws_vpc.Functions-vpc.id
  cidr_block              = element(var.public_cidr_block, count.index)
  map_public_ip_on_launch = true
  availability_zone       = element(var.az_1, count.index)

  tags = {
    Name       = "public-subnet-${count.index + 1}"
    Owner      = local.Owner
    CostCenter = local.CostCenter
    TamDL      = local.TamDL

    environment = var.environment
  }

}

resource "aws_subnet" "private-subnet" {
  count             = 3
  vpc_id            = aws_vpc.Functions-vpc.id
  cidr_block        = element(var.private_cidr_block, count.index + 1)
  availability_zone = element(var.az_1, count.index)

  tags = {
    Name       = "private-subnet-${count.index + 1}"
    Owner      = local.Owner
    CostCenter = local.CostCenter
    TamDL      = local.TamDL

    environment = var.environment
  }

}



#RouteTable
resource "aws_route_table" "public-RouteTable" {
  vpc_id = aws_vpc.Functions-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Functions-IGW.id
  }



  tags = {
    Name       = "${var.vpc_tag}-publicRT"
    Owner      = local.Owner
    CostCenter = local.CostCenter
    TamDL      = local.TamDL

    environment = var.environment
  }
}

resource "aws_route_table" "private-RouteTable" {

  vpc_id = aws_vpc.Functions-vpc.id





  tags = {
    Name       = "${var.vpc_tag}-privateRT"
    Owner      = local.Owner
    CostCenter = local.CostCenter
    TamDL      = local.TamDL

    environment = var.environment
  }
}