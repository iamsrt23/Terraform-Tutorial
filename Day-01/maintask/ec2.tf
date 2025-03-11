resource "aws_instance" "web-1" {
    ami = "ami-04b4f1a9cf54c11d0"
    availability_zone = "us-east-1a"
    instance_type = "t2.micro"
    key_name = "aws"
    subnet_id = data.aws_subnet.Terraform_Public_Subnet1-testing.id
    vpc_security_group_ids = [data.aws_security_group.allow_all.id]
    associate_public_ip_address = true	
    tags = {
        Name = "Server-1"
        Env = "Prod"
        Owner = "Teja"
	      CostCenter = "ABCD"
   
}
}



terraform {
  backend "s3" {
    bucket = "terraform250304"
    key = "current-state.tfstate"
    region = "us-east-1"
    
  }
}