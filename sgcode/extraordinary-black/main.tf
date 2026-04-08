module "instance" {
  source = "./modules/instance"

  ami_id                             = var.ami_id
  instance_type                      = "t2.medium"
  availability_zone                  = "eu-central-1a"
  subnet_id                          = var.subnet_id
  security_group_ids                 = var.security_group_ids
  private_ip_address                 = "10.0.0.52"
  private_ips                        = ["10.0.0.52"]
  source_dest_check                  = true
  ebs_optimized                      = false
  monitoring_enabled                 = false
  tenancy                            = "default"
  hibernation_enabled                = false
  enclave_enabled                    = false
  metadata_http_endpoint             = "enabled"
  metadata_http_tokens               = "required"
  metadata_hop_limit                 = 2
  metadata_http_protocol_ipv6        = "disabled"
  metadata_instance_tags             = "disabled"
  capacity_reservation_preference    = "open"
  root_volume_type                   = var.root_volume_type
  root_delete_on_termination         = true
  cpu_core_count                     = 2
  cpu_threads_per_core               = 1
  key_name                           = "taher-private-runner"
  public_key                         = var.public_key
  network_interface_device_index     = 0
  tags = {
    Name = "taher-private-runner-ubuntu"
  }
}