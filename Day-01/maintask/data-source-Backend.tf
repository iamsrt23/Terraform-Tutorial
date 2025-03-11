data "aws_vpc" "terraform-aws-testing" {
  id = "vpc-080c60024c21fda34"
  
}



data "aws_subnet" "Terraform_Public_Subnet1-testing" {
  id = "subnet-08e369e685a3c92db"
}




data "aws_security_group" "allow_all"{
  id = "sg-0dcea5f0cfa781c84"
}

