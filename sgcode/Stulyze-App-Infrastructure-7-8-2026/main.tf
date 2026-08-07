module "vpc" {
  source = "./modules/vpc"

  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = var.vpc_instance_tenancy
  enable_dns_support   = var.vpc_enable_dns_support
  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  tags                 = var.vpc_tags
}

module "internet_gateway" {
  source = "./modules/internet_gateway"

  vpc_id = module.vpc.id
  tags   = var.igw_tags
}

module "subnet" {
  source   = "./modules/subnet"
  for_each = var.subnets

  vpc_id                          = module.vpc.id
  cidr_block                      = each.value.cidr_block
  availability_zone               = each.value.availability_zone
  map_public_ip_on_launch         = each.value.map_public_ip_on_launch
  assign_ipv6_address_on_creation = each.value.assign_ipv6_address_on_creation
  tags                            = each.value.tags
}

module "security_group" {
  source   = "./modules/security_group"
  for_each = var.security_groups

  name        = each.value.name
  description = each.value.description
  vpc_id      = module.vpc.id
  ingress     = each.value.ingress
  egress      = each.value.egress
  tags        = each.value.tags
}

module "route_table" {
  source = "./modules/route_table"

  vpc_id = module.vpc.id
  routes = var.route_table_routes
  tags   = var.route_table_tags
}

module "network_acl" {
  source = "./modules/network_acl"

  default_network_acl_id = var.network_acl_default_network_acl_id
  subnet_ids             = var.network_acl_subnet_ids
  ingress                = var.network_acl_ingress
  egress                 = var.network_acl_egress
  tags                   = var.network_acl_tags
}

module "athena_workgroup" {
  source = "./modules/athena_workgroup"

  name                               = var.athena_workgroup_name
  state                              = var.athena_workgroup_state
  enforce_workgroup_configuration    = var.athena_workgroup_enforce_workgroup_configuration
  publish_cloudwatch_metrics_enabled = var.athena_workgroup_publish_cloudwatch_metrics_enabled
  requester_pays_enabled             = var.athena_workgroup_requester_pays_enabled
  selected_engine_version            = var.athena_workgroup_selected_engine_version
  tags                               = var.athena_workgroup_tags
}

module "cloudformation_stack" {
  source = "./modules/cloudformation_stack"

  name             = var.cloudformation_stack_name
  disable_rollback = var.cloudformation_stack_disable_rollback
  tags             = var.cloudformation_stack_tags
}
