module "key_pair" {
  source = "./modules/key_pair"

  key_name   = "taher-private-runner"
  public_key = var.taher_private_runner_public_key
}

module "instance" {
  source = "./modules/instance"

  ami_id                               = "ami-0b74f796d330ab49c"
  instance_type                        = "t2.medium"
  availability_zone                    = "eu-central-1a"
  key_name                             = module.key_pair.key_name
  subnet_id                            = var.subnet_id
  security_group_ids                   = var.security_group_ids
  private_ip_address                   = "10.0.0.41"
  source_dest_check                    = true
  ebs_optimized                        = false
  monitoring_enabled                   = false
  tenancy                              = "default"
  cpu_core_count                       = 2
  cpu_threads_per_core                 = 1
  hibernation_enabled                  = false
  metadata_http_endpoint               = "enabled"
  metadata_http_tokens                 = "required"
  metadata_http_put_response_hop_limit = 2
  metadata_http_protocol_ipv6          = "disabled"
  metadata_instance_metadata_tags      = "disabled"
  enclave_enabled                      = false
  capacity_reservation_preference      = "open"
  root_volume_type                     = var.root_volume_type
  root_delete_on_termination           = true
  instance_tags                        = { Name = "taher-private-runner-amz" }
  network_interface_private_ips        = ["10.0.0.41"]
  network_interface_device_index       = 0
}