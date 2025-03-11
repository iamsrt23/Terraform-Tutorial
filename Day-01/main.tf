# cloud Provider
provider "aws" {
  region = "us-east-1"

}

# Creating VPC
resource "aws_vpc" "day1-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = "true"

  tags = {
    Name = "day1-vpc"
  }

}


#IGW
resource "aws_internet_gateway" "day1-Igw" {
  vpc_id = aws_vpc.day1-vpc.id

  tags = {
    Name = "day1-Igw"
  }

}

#Subnets
resource "aws_subnet" "day1-subnet-1" {
  vpc_id     = aws_vpc.day1-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "day1-subnet-1"
  }

}

#RouteTable
resource "aws_route_table" "day1-RouteTable" {
  vpc_id = aws_vpc.day1-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.day1-Igw.id
  }



  tags = {
    Name    = "day1-RouteTable"
    Service = "Terraform"
  }
}


#RouteTable Association
resource "aws_route_table_association" "day1-RTA" {
  subnet_id      = aws_subnet.day1-subnet-1.id
  route_table_id = aws_route_table.day1-RouteTable.id
}


#Security Groups
resource "aws_security_group" "day1-SG" {
  name        = "day1-SG"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.day1-vpc.id

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
    Name = "day1-SG"
  }
}