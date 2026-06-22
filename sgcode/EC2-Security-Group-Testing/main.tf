module "instance" {
  source   = "./modules/instance"
  for_each = var.instances

  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = each.value.vpc_security_group_ids
  availability_zone      = each.value.availability_zone
  source_dest_check      = each.value.source_dest_check
  ebs_optimized          = each.value.ebs_optimized
  monitoring             = each.value.monitoring
  tags                   = each.value.tags
}

module "network_interface" {
  source   = "./modules/network_interface"
  for_each = var.network_interfaces

  subnet_id         = each.value.subnet_id
  security_groups   = each.value.security_groups
  private_ip        = each.value.private_ip
  source_dest_check = each.value.source_dest_check
  description       = each.value.description
  tags              = each.value.tags
}
