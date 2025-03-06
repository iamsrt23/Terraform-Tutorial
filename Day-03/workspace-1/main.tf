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
resource "aws_vpc" "workspaceDay3-vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = "true"

  tags = {
    Name = var.vpc_tag
  }

}


#IGW
resource "aws_internet_gateway" "workspaceDay3-Igw" {
  vpc_id = aws_vpc.workspaceDay3-vpc.id

  tags = {
    Name = var.igw_tag
  }

}

#Subnets
resource "aws_subnet" "workspaceDay3-subnet-1" {
  vpc_id                  = aws_vpc.workspaceDay3-vpc.id
  cidr_block              = var.public_1_cidrblock
  map_public_ip_on_launch = true
  availability_zone       = var.az_1

  tags = {
    Name = var.public_subnet_1_tag
  }

}

resource "aws_subnet" "workspaceDay3-subnet-2" {
  vpc_id                  = aws_vpc.workspaceDay3-vpc.id
  cidr_block              = var.public_2_cidrblock
  map_public_ip_on_launch = true
  availability_zone       = var.az_1

  tags = {
    Name = var.public_subnet_2_tag
  }

}

resource "aws_subnet" "workspaceDay3-subnet-3" {
  vpc_id                  = aws_vpc.workspaceDay3-vpc.id
  cidr_block              = var.public_3_cidrblock
  map_public_ip_on_launch = true
  availability_zone       = var.az_1

  tags = {
    Name = var.public_subnet_3_tag
  }

}

#RouteTable
resource "aws_route_table" "workspaceDay3-RouteTable" {
  vpc_id = aws_vpc.workspaceDay3-vpc.id

  route {
    cidr_block = var.rt_cidr_block
    gateway_id = aws_internet_gateway.workspaceDay3-Igw.id
  }



  tags = {
    Name    = var.route_table_tag
    Service = "Terraform"
  }
}


#RouteTable Association
resource "aws_route_table_association" "workspaceDay3-RTA" {
  subnet_id      = aws_subnet.workspaceDay3-subnet-1.id
  route_table_id = aws_route_table.workspaceDay3-RouteTable.id
}


#Security Groups
resource "aws_security_group" "workspaceDay3-SG" {
  name        = "workspaceDay3-SG"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.workspaceDay3-vpc.id

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
    Name = "workspaceDay3-SG"
  }
}



# #EC2
# resource "aws_instance" "web-1" {
#   ami                         = "ami-0866a3c8686eaeeba"
#   availability_zone           = var.ec2_az
#   instance_type               = var.instance_type
#   key_name                    = var.key_name
#   subnet_id                   = aws_subnet.workspaceDay3-subnet-1.id
#   vpc_security_group_ids      = ["${aws_security_group.workspaceDay3-SG.id}"]
#   associate_public_ip_address = true
#   tags = {
#     Name       = "Dev-Server"
#     Env        = var.environment
#     Owner      = "Teja"
#     CostCenter = "ABCD"
#   }
# }