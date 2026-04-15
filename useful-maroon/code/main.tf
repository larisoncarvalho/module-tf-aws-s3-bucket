module "instance" {
  source = "./modules/instance"

  ami_id                         = "ami-03074cc1b166e8691"
  instance_type                  = "t2.medium"
  availability_zone              = "eu-central-1a"
  subnet_id                      = var.subnet_id
  security_group_ids             = var.security_group_ids
  key_name                       = "taher-private-runner"
  monitoring_enabled             = false
  ebs_optimized                  = false
  source_dest_check              = true
  tenancy                        = "default"
  metadata_http_endpoint         = "enabled"
  metadata_http_tokens           = "required"
  metadata_hop_limit             = 2
  metadata_http_protocol_ipv6    = "disabled"
  metadata_instance_tags         = "disabled"
  root_volume_type               = var.root_volume_type
  root_delete_on_termination     = true
  enclave_enabled                = false
  cpu_core_count                 = 2
  cpu_threads_per_core           = 1
  capacity_reservation_preference = "open"
}