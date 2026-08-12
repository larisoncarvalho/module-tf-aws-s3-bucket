module "athena_workgroup" {
  source   = "./modules/athena_workgroup"
  for_each = var.athena_workgroups

  name                               = each.value.name
  state                              = each.value.state
  enforce_workgroup_configuration    = each.value.enforce_workgroup_configuration
  publish_cloudwatch_metrics_enabled = each.value.publish_cloudwatch_metrics_enabled
  requester_pays_enabled             = each.value.requester_pays_enabled
  selected_engine_version            = each.value.selected_engine_version
}

module "cloudformation_stack" {
  source   = "./modules/cloudformation_stack"
  for_each = var.cloudformation_stacks

  name             = each.value.name
  disable_rollback = each.value.disable_rollback
  tags             = each.value.tags
}

module "iam_policy" {
  source   = "./modules/iam_policy"
  for_each = var.iam_policies

  name        = each.value.name
  path        = each.value.path
  description = each.value.description
  policy      = file("${path.module}/policies/${each.value.policy_file}")
  tags        = each.value.tags
}

module "iam_role" {
  source   = "./modules/iam_role"
  for_each = var.iam_roles

  name                 = each.value.name
  path                 = each.value.path
  description          = each.value.description
  max_session_duration = each.value.max_session_duration
  assume_role_policy   = each.value.assume_role_policy
  tags                 = each.value.tags
}

module "vpc" {
  source = "./modules/vpc"

  cidr_block       = var.vpc.cidr_block
  instance_tenancy = var.vpc.instance_tenancy
  tags             = var.vpc.tags
}

module "subnet" {
  source   = "./modules/subnet"
  for_each = var.subnets

  cidr_block                      = each.value.cidr_block
  availability_zone               = each.value.availability_zone
  vpc_id                          = each.value.vpc_id
  map_public_ip_on_launch         = each.value.map_public_ip_on_launch
  assign_ipv6_address_on_creation = each.value.assign_ipv6_address_on_creation
  tags                            = each.value.tags
}

module "security_group" {
  source   = "./modules/security_group"
  for_each = var.security_groups

  name        = each.value.name
  description = each.value.description
  vpc_id      = each.value.vpc_id
  tags        = each.value.tags
}

module "internet_gateway" {
  source = "./modules/internet_gateway"

  vpc_id = var.internet_gateway.vpc_id
  tags   = var.internet_gateway.tags
}

module "route_table" {
  source = "./modules/route_table"

  vpc_id = var.route_table.vpc_id
  routes = var.route_table.routes
  tags   = var.route_table.tags
}

module "network_acl" {
  source = "./modules/network_acl"

  default_network_acl_id = var.network_acl.default_network_acl_id
  ingress_rules          = var.network_acl.ingress_rules
  egress_rules           = var.network_acl.egress_rules
  tags                   = var.network_acl.tags
}
