region             = "us-east-1"
vpc_cidr_block     = "172.18.0.0/16"
vpc_tag            = "Functions-vpc"
az_1               = ["us-east-1a", "us-east-1b", "us-east-1c"]
key_name           = "aws"
public_cidr_block  = ["172.18.1.0/24", "172.18.2.0/24", "172.18.3.0/24", "172.18.4.0/24", "172.18.5.0/24"]
private_cidr_block = ["172.18.10.0/24", "172.18.20.0/24", "172.18.30.0/24", "172.18.40.0/24", "172.18.50.0/24"]
environment        = "dev"
ingress_service    = ["80", "8080", "22", "443","3306","9000"]

  