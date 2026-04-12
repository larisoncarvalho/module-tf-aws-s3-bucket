module "key_pair" {
  source = "./modules/key_pair"

  key_name   = var.key_pair_key_name
  public_key = var.key_pair_public_key
}

module "instance" {
  source = "./modules/instance"

  ami_id                                  = var.instance_ami_id
  capacity_reservation_preference         = var.instance_capacity_reservation_preference
  cpu_core_count                          = var.instance_cpu_core_count
  cpu_threads_per_core                    = var.instance_cpu_threads_per_core
  ebs_optimized                           = var.instance_ebs_optimized
  enclave_options_enabled                 = var.instance_enclave_options_enabled
  hibernation                             = var.instance_hibernation
  instance_name_tag                       = var.instance_instance_name_tag
  instance_type                           = var.instance_instance_type
  key_name                                = module.key_pair.key_name
  metadata_http_endpoint                  = var.instance_metadata_http_endpoint
  metadata_http_put_response_hop_limit    = var.instance_metadata_http_put_response_hop_limit
  metadata_http_tokens                    = var.instance_metadata_http_tokens
  monitoring                              = var.instance_monitoring
  private_ip_address                      = var.instance_private_ip_address
  root_block_device_delete_on_termination = var.instance_root_block_device_delete_on_termination
  security_group_ids                      = var.instance_security_group_ids
  source_dest_check                       = var.instance_source_dest_check
  subnet_id                               = var.instance_subnet_id
  tenancy                                 = var.instance_tenancy
}