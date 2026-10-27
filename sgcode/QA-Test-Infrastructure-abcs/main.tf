module "vpc" {
  source   = "./modules/vpc"
  for_each = var.vpcs

  cidr_block           = each.value.cidr_block
  instance_tenancy     = each.value.instance_tenancy
  enable_dns_support   = each.value.enable_dns_support
  enable_dns_hostnames = each.value.enable_dns_hostnames
  tags                 = each.value.tags
}

module "subnet" {
  source   = "./modules/subnet"
  for_each = var.subnets

  vpc_id                  = each.value.vpc_id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  tags                    = each.value.tags
}

module "security_group" {
  source   = "./modules/security_group"
  for_each = var.security_groups

  name          = each.value.name
  description   = each.value.description
  vpc_id        = each.value.vpc_id
  ingress_rules = each.value.ingress_rules
  egress_rules  = each.value.egress_rules
  tags          = each.value.tags
}

module "network_interface" {
  source   = "./modules/network_interface"
  for_each = var.network_interfaces

  subnet_id         = each.value.subnet_id
  private_ip        = each.value.private_ip
  security_groups   = each.value.security_groups
  source_dest_check = each.value.source_dest_check
  description       = each.value.description
  tags              = each.value.tags
}

module "instance" {
  source   = "./modules/instance"
  for_each = var.instances

  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  subnet_id              = each.value.subnet_id
  key_name               = each.value.key_name
  vpc_security_group_ids = each.value.vpc_security_group_ids
  iam_instance_profile   = each.value.iam_instance_profile
  monitoring             = each.value.monitoring
  ebs_optimized          = each.value.ebs_optimized
  source_dest_check      = each.value.source_dest_check
  user_data              = each.value.user_data
  metadata_options       = each.value.metadata_options
  root_block_device      = each.value.root_block_device
  tags                   = each.value.tags
  vxcvcb
}
