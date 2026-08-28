module "instance" {
  source   = "./modules/instance"
  for_each = var.instances

  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  key_name               = each.value.key_name
  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = each.value.vpc_security_group_ids
  source_dest_check      = each.value.source_dest_check
  monitoring             = each.value.monitoring
  ebs_optimized          = each.value.ebs_optimized
  tags                   = each.value.tags
  metadata_options       = each.value.metadata_options
  root_block_device      = each.value.root_block_device
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
  multi_attach_enabled = each.value.multi_attach_enabled
  snapshot_id          = each.value.snapshot_id
  tags                 = each.value.tags
}

module "network_interface" {
  source   = "./modules/network_interface"
  for_each = var.network_interfaces

  subnet_id         = each.value.subnet_id
  security_groups   = each.value.security_groups
  private_ips       = each.value.private_ips
  source_dest_check = each.value.source_dest_check
  description       = each.value.description
  tags              = each.value.tags
}
