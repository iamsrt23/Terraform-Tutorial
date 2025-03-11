module "prod_ec2" {
  source      = "../modules/compute"
  environment = module.prod_vpc_1.environment
  amis = {
    us-east-1 = "ami-04b4f1a9cf54c11d0",
  us-east-2 = "ami-0cb91c7de36eed2cb" }
  region         = var.region
  key_name       = "aws"
  public_subnet  = module.prod_vpc_1.public_subnet
  private_subnet = module.prod_vpc_1.private_subnet
  sg_id          = module.prod_sg.sg_id
  public_cidr    = module.prod_vpc_1.public_cidr
  private_cidr   = module.prod_vpc_1.private_cidr
  vpc_tag        = module.prod_vpc_1.vpc_tag


}