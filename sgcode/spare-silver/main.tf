module "vpc_vpc_name" {
  source = "./modules/vpc"

  cidr_block       = var.vpc_vpc_name.cidr_block
  instance_tenancy = var.vpc_vpc_name.instance_tenancy
  tags             = var.vpc_vpc_name.tags
}

module "subnet_vpc_name_public_eu_central_1a" {
  source = "./modules/subnet"

  availability_zone       = var.subnet_vpc_name_public_eu_central_1a.availability_zone
  cidr_block              = var.subnet_vpc_name_public_eu_central_1a.cidr_block
  map_public_ip_on_launch = var.subnet_vpc_name_public_eu_central_1a.map_public_ip_on_launch
  tags                    = var.subnet_vpc_name_public_eu_central_1a.tags
  vpc_id                  = module.vpc_vpc_name.vpc_id
}

module "security_group_6y8ixgma" {
  source = "./modules/security_group"

  description = var.security_group_6y8ixgma.description
  name        = var.security_group_6y8ixgma.name
  rules       = var.security_group_6y8ixgma.rules
  vpc_id      = module.vpc_vpc_name.vpc_id
}

module "instance_6y8ixgma" {
  source = "./modules/instance"

  ami                    = var.instance_6y8ixgma.ami
  availability_zone      = var.instance_6y8ixgma.availability_zone
  ebs_device_name        = var.instance_6y8ixgma.ebs_device_name
  ebs_encrypted          = var.instance_6y8ixgma.ebs_encrypted
  ebs_optimized          = var.instance_6y8ixgma.ebs_optimized
  ebs_snapshot_id        = var.instance_6y8ixgma.ebs_snapshot_id
  ebs_volume_iops        = var.instance_6y8ixgma.ebs_volume_iops
  ebs_volume_size        = var.instance_6y8ixgma.ebs_volume_size
  ebs_volume_type        = var.instance_6y8ixgma.ebs_volume_type
  instance_type          = var.instance_6y8ixgma.instance_type
  key_name               = var.instance_6y8ixgma.key_name
  monitoring             = var.instance_6y8ixgma.monitoring
  source_dest_check      = var.instance_6y8ixgma.source_dest_check
  subnet_id              = module.subnet_vpc_name_public_eu_central_1a.subnet_id
  vpc_security_group_ids = [module.security_group_6y8ixgma.security_group_id]
}