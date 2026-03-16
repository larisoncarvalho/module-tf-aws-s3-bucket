module "route_table_vpc_name_private_eu_central_1a" {
  source = "./modules/route_table"

  vpc_id       = var.route_table_vpc_name_private_eu_central_1a.vpc_id
  tags         = var.route_table_vpc_name_private_eu_central_1a.tags
  routes       = var.route_table_vpc_name_private_eu_central_1a.routes
  associations = var.route_table_vpc_name_private_eu_central_1a.associations
}