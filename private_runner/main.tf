module "key_pair" {
  source   = "./modules/key_pair"
  for_each = var.key_pairs

  key_name = each.value.key_name
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
  multi_attach_enabled = each.value.multi_attach_enabled
  tags                 = each.value.tags
}

module "network_interface" {
  source   = "./modules/network_interface"
  for_each = var.network_interfaces

  subnet_id         = each.value.subnet_id
  private_ips       = each.value.private_ips
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
  key_name               = each.value.key_name
  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = each.value.vpc_security_group_ids
  availability_zone      = each.value.availability_zone
  tenancy                = each.value.tenancy
  monitoring             = each.value.monitoring
  ebs_optimized          = each.value.ebs_optimized
  source_dest_check      = each.value.source_dest_check

  root_volume_size                  = each.value.root_volume_size
  root_volume_type                  = each.value.root_volume_type
  root_volume_delete_on_termination = each.value.root_volume_delete_on_termination

  metadata_http_endpoint               = each.value.metadata_http_endpoint
  metadata_http_tokens                 = each.value.metadata_http_tokens
  metadata_http_put_response_hop_limit = each.value.metadata_http_put_response_hop_limit

  cpu_core_count       = each.value.cpu_core_count
  cpu_threads_per_core = each.value.cpu_threads_per_core

  tags = each.value.tags
}
