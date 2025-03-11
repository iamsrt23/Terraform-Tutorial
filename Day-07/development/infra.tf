module "dev_vpc_1" {
  source       = "../modules/network"
  vpc_cidr     = "10.0.0.0/16"
  vpc_tag      = "dev_vpc_1"
  environment  = "dev"
  public_cidr  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_cidr = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
  azs          = ["us-east-1a", "us-east-1b", "us-east-1c"]
}