module "instance" {
  source   = "./modules/instance"
  for_each = var.instances

  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  key_name               = each.value.key_name
  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = each.value.vpc_security_group_ids
  source_dest_check      = each.value.source_dest_check
  ebs_optimized          = each.value.ebs_optimized
  monitoring             = each.value.monitoring
  tenancy                = each.value.tenancy
  availability_zone      = each.value.availability_zone
  tags                   = each.value.tags
  root_block_device      = each.value.root_block_device
  metadata_options       = each.value.metadata_options
}

module "ebs_volume" {
  source   = "./modules/ebs_volume"
  for_each = var.ebs_volumes

  availability_zone    = each.value.availability_zone
  size                 = each.value.size
  type                 = each.value.type
  iops                 = each.value.iops
  throughput           = each.value.throughput
  encrypted            = each.value.encrypted
  snapshot_id          = each.value.snapshot_id
  multi_attach_enabled = each.value.multi_attach_enabled
  tags                 = each.value.tags
}


module "network_interface" {
  source   = "./modules/network_interface"
  for_each = var.network_interfaces

  subnet_id         = each.value.subnet_id
  security_groups   = each.value.security_groups
  description       = each.value.description
  private_ips       = each.value.private_ips
  source_dest_check = each.value.source_dest_check
  tags              = each.value.tags
}
