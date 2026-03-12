module "do_not_delete_vpc" {
  source = "./modules/vpc"

  cidr_block           = var.do_not_delete_vpc.cidr_block
  enable_dns_hostnames = var.do_not_delete_vpc.enable_dns_hostnames
  enable_dns_support   = var.do_not_delete_vpc.enable_dns_support
  instance_tenancy     = var.do_not_delete_vpc.instance_tenancy
  tags                 = var.do_not_delete_vpc.tags
}

module "subnets" {
  source   = "./modules/subnet"
  for_each = var.subnets

  availability_zone       = each.value.availability_zone
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  tags                    = each.value.tags
  vpc_id                  = module.do_not_delete_vpc.vpc_id
}

module "do_not_delete_igw" {
  source = "./modules/internet_gateway"

  tags   = var.do_not_delete_igw.tags
  vpc_id = module.do_not_delete_vpc.vpc_id
}

module "do_not_delete_private_route_table" {
  source = "./modules/route_table"

  routes              = var.do_not_delete_private_route_table.routes
  subnet_associations = var.do_not_delete_private_route_table.subnet_associations
  tags                = var.do_not_delete_private_route_table.tags
  vpc_id              = module.do_not_delete_vpc.vpc_id
}

module "default_security_group" {
  source = "./modules/security_group"

  description = var.default_security_group.description
  name        = var.default_security_group.name
  tags        = var.default_security_group.tags
  vpc_id      = module.do_not_delete_vpc.vpc_id
}

module "do_not_delete_default_nacl" {
  source = "./modules/network_acl"

  acl_rules  = var.do_not_delete_default_nacl.acl_rules
  subnet_ids = var.do_not_delete_default_nacl.subnet_ids
  tags       = var.do_not_delete_default_nacl.tags
  vpc_id     = module.do_not_delete_vpc.vpc_id
}