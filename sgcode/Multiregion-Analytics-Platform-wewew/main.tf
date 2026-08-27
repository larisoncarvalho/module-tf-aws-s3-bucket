module "athena_workgroup" {
  source = "./modules/athena_workgroup"

  name                               = var.athena_workgroup_name
  description                        = var.athena_workgroup_description
  state                              = var.athena_workgroup_state
  enforce_workgroup_configuration    = var.athena_workgroup_enforce_workgroup_configuration
  publish_cloudwatch_metrics_enabled = var.athena_workgroup_publish_cloudwatch_metrics_enabled
  requester_pays_enabled             = var.athena_workgroup_requester_pays_enabled
}

module "cloudformation_stack" {
  source = "./modules/cloudformation_stack"

  name             = var.cloudformation_stack_name
  disable_rollback = var.cloudformation_stack_disable_rollback
}

module "iam_policy" {
  source   = "./modules/iam_policy"
  for_each = var.iam_policies

  name        = each.value.name
  path        = each.value.path
  description = each.value.description
  policy      = each.value.policy
}

module "iam_role" {
  source   = "./modules/iam_role"
  for_each = var.iam_roles

  name                 = each.value.name
  path                 = each.value.path
  description          = each.value.description
  assume_role_policy   = each.value.assume_role_policy
  max_session_duration = each.value.max_session_duration
}

module "default_vpc" {
  source = "./modules/default_vpc"
}

module "internet_gateway" {
  source = "./modules/internet_gateway"

  vpc_id = var.internet_gateway_vpc_id
}

module "default_subnet" {
  source   = "./modules/default_subnet"
  for_each = var.default_subnets

  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  tags                    = each.value.tags
}

module "security_group" {
  source   = "./modules/security_group"
  for_each = var.security_groups

  name        = each.value.name
  description = each.value.description
  vpc_id      = each.value.vpc_id
  ingress     = each.value.ingress
  egress      = each.value.egress
  tags        = each.value.tags
}

module "default_security_group" {
  source = "./modules/default_security_group"

  vpc_id  = var.default_security_group_vpc_id
  ingress = var.default_security_group_ingress
  egress  = var.default_security_group_egress
}

module "route_table" {
  source = "./modules/route_table"

  vpc_id = var.route_table_vpc_id
  routes = var.route_table_routes
}

module "default_network_acl" {
  source = "./modules/default_network_acl"

  default_network_acl_id = var.default_network_acl_id
  subnet_ids             = var.default_network_acl_subnet_ids
  ingress                = var.default_network_acl_ingress
  egress                 = var.default_network_acl_egress
}

module "keyspaces_ap_southeast_1" {
  source   = "./modules/keyspaces_keyspace"
  for_each = var.keyspaces_ap_southeast_1

  name                 = each.value.name
  replication_strategy = each.value.replication_strategy
  tags                 = each.value.tags
}

module "keyspaces_eu_central_1" {
  source   = "./modules/keyspaces_keyspace"
  for_each = var.keyspaces_eu_central_1

  providers = {
    aws = aws.eu_central_1
  }

  name                 = each.value.name
  replication_strategy = each.value.replication_strategy
  tags                 = each.value.tags
}

module "keyspaces_us_west_1" {
  source   = "./modules/keyspaces_keyspace"
  for_each = var.keyspaces_us_west_1

  providers = {
    aws = aws.us_west_1
  }

  name                 = each.value.name
  replication_strategy = each.value.replication_strategy
  tags                 = each.value.tags
}
