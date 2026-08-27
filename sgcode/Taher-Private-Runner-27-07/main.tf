module "instance" {
  source   = "./modules/instance"
  for_each = var.instances

  ami                     = each.value.ami
  instance_type           = each.value.instance_type
  subnet_id               = each.value.subnet_id
  vpc_security_group_ids  = each.value.vpc_security_group_ids
  key_name                = each.value.key_name
  availability_zone       = each.value.availability_zone
  tenancy                 = each.value.tenancy
  ebs_optimized           = each.value.ebs_optimized
  source_dest_check       = each.value.source_dest_check
  monitoring              = each.value.monitoring
  hibernation             = each.value.hibernation
  enclave_options_enabled = each.value.enclave_options_enabled
  root_block_device       = each.value.root_block_device
  metadata_options        = each.value.metadata_options
  cpu_options             = each.value.cpu_options
  tags                    = each.value.tags
}

module "ebs_volume" {
  source   = "./modules/ebs_volume"
  for_each = var.ebs_volumes

  availability_zone    = each.value.availability_zone
  size                 = each.value.size
  volume_type          = each.value.volume_type
  iops                 = each.value.iops
  throughput           = each.value.throughput
  encrypted            = each.value.encrypted
  snapshot_id          = each.value.snapshot_id
  multi_attach_enabled = each.value.multi_attach_enabled
  tags                 = each.value.tags
}

module "key_pair" {
  source   = "./modules/key_pair"
  for_each = var.key_pairs

  key_name   = each.value.key_name
  public_key = var.key_pair_public_key
  tags       = each.value.tags
}

module "network_interface" {
  source   = "./modules/network_interface"
  for_each = var.network_interfaces

  subnet_id         = each.value.subnet_id
  private_ips       = each.value.private_ips
  security_groups   = each.value.security_groups
  description       = each.value.description
  source_dest_check = each.value.source_dest_check
  tags              = each.value.tags
}
