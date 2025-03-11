data "aws_vpc" "datasource-vpc" { 
  id = "vpc-0c036eeba55cec6af"
}


resource "aws_internet_gateway" "datasource-igw" {
  vpc_id = data.aws_vpc.datasource-vpc.id
  
  tags = {
    Name="datasource-igw"
  }
}