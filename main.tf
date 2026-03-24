module "subnets" {
  source = "./modules/subnet"

  vpc_id  = var.vpc_id
  subnets = var.subnets
}