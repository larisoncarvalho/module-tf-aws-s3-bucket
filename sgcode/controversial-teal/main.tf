module "key_pair" {
  source = "./modules/key_pair"

  key_name   = var.key_pair_key_name
  public_key = var.key_pair_public_key
}

module "instance" {
  source = "./modules/instance"

  ami                                     = var.instance_ami
  availability_zone                       = var.instance_availability_zone
  capacity_reservation_preference         = var.instance_capacity_reservation_preference
  ebs_optimized                           = var.instance_ebs_optimized
  enclave_options_enabled                 = var.instance_enclave_options_enabled
  instance_type                           = var.instance_instance_type
  key_name                                = module.key_pair.key_name
  metadata_http_endpoint                  = var.instance_metadata_http_endpoint
  metadata_http_protocol_ipv6             = var.instance_metadata_http_protocol_ipv6
  metadata_http_put_response_hop_limit    = var.instance_metadata_http_put_response_hop_limit
  metadata_http_tokens                    = var.instance_metadata_http_tokens
  metadata_instance_metadata_tags         = var.instance_metadata_instance_metadata_tags
  monitoring                              = var.instance_monitoring
  root_block_device_delete_on_termination = var.instance_root_block_device_delete_on_termination
  source_dest_check                       = var.instance_source_dest_check
  subnet_id                               = var.instance_subnet_id
  tags                                    = var.instance_tags
  tenancy                                 = var.instance_tenancy
  vpc_security_group_ids                  = var.instance_vpc_security_group_ids
}

module "ebs_volume" {
  source = "./modules/ebs_volume"

  availability_zone    = var.ebs_volume_availability_zone
  encrypted            = var.ebs_volume_encrypted
  iops                 = var.ebs_volume_iops
  multi_attach_enabled = var.ebs_volume_multi_attach_enabled
  size                 = var.ebs_volume_size
  snapshot_id          = var.ebs_volume_snapshot_id
  throughput           = var.ebs_volume_throughput
  type                 = var.ebs_volume_type
}

module "network_interface" {
  source = "./modules/network_interface"

  private_ips       = var.network_interface_private_ips
  security_groups   = var.network_interface_security_groups
  source_dest_check = var.network_interface_source_dest_check
  subnet_id         = var.network_interface_subnet_id
}