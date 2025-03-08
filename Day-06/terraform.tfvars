region             = "us-east-1"
vpc_cidr_block     = "172.18.0.0/16"
vpc_tag            = "Functions-vpc"
az_1               = ["us-east-1a", "us-east-1b", "us-east-1c"]
key_name           = "aws"
public_cidr_block  = ["172.18.1.0/24", "172.18.2.0/24", "172.18.3.0/24"]
private_cidr_block = ["172.18.10.0/24", "172.18.20.0/24", "172.18.30.0/24"]
environment        = "Prod"
ingress_service    = ["80", "8080", "22", "443", "3306", "9000"]
amis = {
  us-east-1 = "ami-04b4f1a9cf54c11d0"
  us-east-2 = "ami-0cb91c7de36eed2cb"
}

  