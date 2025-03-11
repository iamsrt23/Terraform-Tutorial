module "dev_ec2" {
  source      = "../modules/compute"
  environment = module.dev_vpc_1.environment
  amis = {
    us-east-1 = "ami-04b4f1a9cf54c11d0",
  us-east-2 = "ami-0cb91c7de36eed2cb" }
  region         = var.region
  key_name       = "aws"
  public_subnet  = module.dev_vpc_1.public_subnet
  private_subnet = module.dev_vpc_1.private_subnet
  sg_id          = module.dev_sg_1.sg_id
  public_cidr    = module.dev_vpc_1.public_cidr
  private_cidr   = module.dev_vpc_1.private_cidr
  vpc_tag        = module.dev_vpc_1.vpc_tag
}