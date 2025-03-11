module "prod_sg" {
  source          = "../modules/sg"
  vpc_tag         = module.prod_vpc_1.vpc_tag
  vpc_id          = module.prod_vpc_1.vpc_id
  ingress_service = ["80", "8080", "22", "443", "3306", "9000"]
  environment     = module.prod_vpc_1.environment

}