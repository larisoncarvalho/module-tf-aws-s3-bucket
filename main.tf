module "route_table_vpc_name_private_eu_central_1a" {
  source = "./modules/route_table"

  associations = var.route_table_vpc_name_private_eu_central_1a.associations
  routes       = var.route_table_vpc_name_private_eu_central_1a.routes
  tags         = var.route_table_vpc_name_private_eu_central_1a.tags
  vpc_id       = var.route_table_vpc_name_private_eu_central_1a.vpc_id
}