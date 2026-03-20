module "vpc" {
  source = "./modules/vpc"

  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  tags = {
    Name = "sg-vpc-1109"
  }
}

module "subnet" {
  source = "./modules/subnet"

  vpc_id                  = module.vpc.vpc_id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = false
  tags = {
    Name = "sg-vpc-1109-private-eu-central-1b"
  }
}

module "route_table" {
  source = "./modules/route_table"

  vpc_id    = module.vpc.vpc_id
  subnet_id = module.subnet.subnet_id
  tags = {
    Name = "sg-vpc-1109-private-eu-central-1b"
  }
}

module "network_acl" {
  source = "./modules/network_acl"

  default_network_acl_id = var.default_network_acl_id != null ? var.default_network_acl_id : module.vpc.default_network_acl_id
  subnet_ids             = length(var.network_acl_subnet_ids) > 0 ? var.network_acl_subnet_ids : [module.subnet.subnet_id]
}