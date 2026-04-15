module "vpc" {
  source = "./modules/vpc"

  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "vpc_name"
  }
}

module "subnets" {
  source = "./modules/subnet"

  subnets = var.subnets
  vpc_id  = module.vpc.vpc_id
}

module "internet_gateway" {
  source = "./modules/internet_gateway"

  tags = {
    Name = "vpc_name"
  }
  vpc_id = module.vpc.vpc_id
}

module "route_tables" {
  source = "./modules/route_table"

  route_table_associations = var.route_table_associations
  route_tables             = var.route_tables
  routes                   = var.routes
  vpc_id                   = module.vpc.vpc_id
}

module "security_groups" {
  source = "./modules/security_group"

  egress_rules     = var.egress_rules
  ingress_rules    = var.ingress_rules
  security_groups  = var.security_groups
  vpc_id           = module.vpc.vpc_id
}

module "network_acl" {
  source = "./modules/network_acl"

  acl_rules  = var.acl_rules
  subnet_ids = var.network_acl_subnet_ids
  vpc_id     = module.vpc.vpc_id
}

module "vpc_endpoints" {
  source = "./modules/vpc_endpoint"

  vpc_endpoints = var.vpc_endpoints
  vpc_id        = module.vpc.vpc_id
}

module "instances" {
  source = "./modules/instance"

  instances = var.instances
}

module "efs_mount_targets" {
  source = "./modules/efs_mount_target"

  file_system_id = var.efs_file_system_id
  mount_targets  = var.efs_mount_targets
}