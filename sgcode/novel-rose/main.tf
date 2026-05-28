module "vpc" {
  source = "git::https://github.com/StackGuardian/terraform-aws-vpc.git?ref=v5.1.0"

  name                           = var.vpc_name
  cidr                           = var.vpc_cidr
  instance_tenancy               = var.vpc_instance_tenancy
  azs                            = var.azs
  public_subnets                 = var.public_subnets
  private_subnets                = var.private_subnets
  map_public_ip_on_launch        = var.map_public_ip_on_launch
  create_igw                     = var.create_igw
  create_egress_only_igw         = var.create_egress_only_igw
  enable_nat_gateway             = var.enable_nat_gateway
  manage_default_security_group  = var.manage_default_security_group
  manage_default_network_acl     = var.manage_default_network_acl
  manage_default_route_table     = var.manage_default_route_table
  create_vpc                     = var.create_vpc
}