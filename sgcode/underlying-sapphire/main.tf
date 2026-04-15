module "vpc" {
  source = "./modules/vpc"

  name                 = var.name
  cidr_block           = var.cidr_block
  instance_tenancy     = var.instance_tenancy
  subnets              = var.subnets
  route_tables         = var.route_tables
  routes               = var.routes
  route_table_associations = var.route_table_associations
  main_route_table_key = var.main_route_table_key
}