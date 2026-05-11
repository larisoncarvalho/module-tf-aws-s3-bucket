module "instance" {
  source = "./modules/instance"

  ami                                     = var.ami
  availability_zone                       = var.availability_zone
  capacity_reservation_preference         = var.capacity_reservation_preference
  ebs_optimized                           = var.ebs_optimized
  enclave_options_enabled                 = var.enclave_options_enabled
  instance_type                           = var.instance_type
  key_name                                = var.key_name
  metadata_http_endpoint                  = var.metadata_http_endpoint
  metadata_http_protocol_ipv6             = var.metadata_http_protocol_ipv6
  metadata_http_put_response_hop_limit    = var.metadata_http_put_response_hop_limit
  metadata_http_tokens                    = var.metadata_http_tokens
  metadata_instance_metadata_tags         = var.metadata_instance_metadata_tags
  monitoring                              = var.monitoring
  root_block_device_delete_on_termination = var.root_block_device_delete_on_termination
  source_dest_check                       = var.source_dest_check
  subnet_id                               = var.subnet_id
  tags                                    = var.tags
  tenancy                                 = var.tenancy
  user_data                               = var.user_data
  vpc_security_group_ids                  = var.vpc_security_group_ids
}