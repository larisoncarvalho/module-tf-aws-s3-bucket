module "internet_gateway" {
  source = "./modules/internet_gateway"

  vpc_id = var.vpc_id
}