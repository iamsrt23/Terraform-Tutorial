# cloud Provider
provider "aws" {
  region = "us-east-1"

}

# Creating VPC
resource "aws_vpc" "day2-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = "true"

  tags = {
    Name = "day2-vpc"
  }

}


#IGW
resource "aws_internet_gateway" "day2-Igw" {
  vpc_id = aws_vpc.day2-vpc.id

  tags = {
    Name = "day2-Igw"
  }

}

#Subnets
resource "aws_subnet" "day2-subnet-1" {
  vpc_id     = aws_vpc.day2-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "day2-subnet-1"
  }

}

#RouteTable
resource "aws_route_table" "day2-RouteTable" {
  vpc_id = aws_vpc.day2-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.day2-Igw.id
  }



  tags = {
    Name    = "day2-RouteTable"
    Service = "Terraform"
  }
}


#RouteTable Association
resource "aws_route_table_association" "day2-RTA" {
  subnet_id      = aws_subnet.day2-subnet-1.id
  route_table_id = aws_route_table.day2-RouteTable.id
}


#Security Groups
resource "aws_security_group" "day2-SG" {
  name        = "day2-SG"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.day2-vpc.id

  ingress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }



  tags = {
    Name = "day2-SG"
  }
}

