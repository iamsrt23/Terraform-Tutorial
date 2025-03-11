module "dev_sg_1" {
  source          = "../modules/sg"
  vpc_tag         = module.dev_vpc_1.vpc_tag
  vpc_id          = module.dev_vpc_1.vpc_id
  ingress_service = ["80", "8080", "22", "443", "3306", "9000"]
  environment     = module.dev_vpc_1.environment

}