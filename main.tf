module "vpc" {
  source = "./modules/vpc_infrastructure"

  availability_zone_a    = var.availability_zone_a
  availability_zone_b    = var.availability_zone_b
  private_subnet_1a_cidr = var.private_subnet_1a_cidr
  private_subnet_1b_cidr = var.private_subnet_1b_cidr
  public_subnet_1a_cidr  = var.public_subnet_1a_cidr
  public_subnet_1b_cidr  = var.public_subnet_1b_cidr
  vpc_cidr               = var.vpc_cidr
  vpc_name               = var.vpc_name
}