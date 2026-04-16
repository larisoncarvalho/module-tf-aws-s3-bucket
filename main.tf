module "athena_workgroup" {
  source = "./modules/athena_workgroup"

  name                               = var.athena_workgroup_name
  state                              = var.athena_workgroup_state
  enforce_workgroup_configuration    = var.athena_enforce_workgroup_configuration
  publish_cloudwatch_metrics_enabled = var.athena_publish_cloudwatch_metrics_enabled
  requester_pays_enabled             = var.athena_requester_pays_enabled
  selected_engine_version            = var.athena_selected_engine_version
}

module "cloudformation_stack" {
  source = "./modules/cloudformation_stack"

  name             = var.cloudformation_stack_name
  disable_rollback = var.cloudformation_disable_rollback
}

module "internet_gateway" {
  source = "./modules/internet_gateway"

  vpc_id = var.internet_gateway_vpc_id
}

module "network_acl" {
  source = "./modules/network_acl"

  default_network_acl_id = var.network_acl_default_network_acl_id
  subnet_ids             = var.network_acl_subnet_ids
}

module "route_table" {
  source = "./modules/route_table"

  vpc_id              = var.route_table_vpc_id
  internet_gateway_id = module.internet_gateway.id
}