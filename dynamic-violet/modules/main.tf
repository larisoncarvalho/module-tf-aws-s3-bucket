module "private_runner" {
  source = "./modules/instance"

  ami_id                         = var.ami_id
  instance_type                  = "t2.large"
  availability_zone              = "eu-central-1a"
  key_name                       = "nonprod-euc1"
  subnet_id                      = var.subnet_id
  security_group_ids             = var.security_group_ids
  private_ip                     = "10.0.0.38"
  source_dest_check              = true
  ebs_optimized                  = false
  monitoring                     = false
  tenancy                        = "default"
  hibernation                    = false
  enclave_enabled                = false
  metadata_http_endpoint         = "enabled"
  metadata_http_tokens           = "optional"
  metadata_hop_limit             = 1
  metadata_http_protocol_ipv6    = "disabled"
  metadata_instance_tags         = "disabled"
  capacity_reservation_preference = "open"
  root_volume_type               = var.root_volume_type
  root_delete_on_termination     = true
  cpu_core_count                 = 2
  cpu_threads_per_core           = 1
  tags = {
    "Name" = "privat-runner"
  }
}