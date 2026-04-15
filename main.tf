module "route_table" {
  source = "./modules/route_table"

  vpc_id = var.vpc_id
  tags   = var.tags
}