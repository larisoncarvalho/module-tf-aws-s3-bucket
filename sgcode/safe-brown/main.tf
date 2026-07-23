module "taher_private_runner_ubuntu" {
  source = "./modules/instance"

  ami_id                               = var.ami_id
  availability_zone                    = "eu-central-1a"
  cpu_core_count                       = 2
  cpu_threads_per_core                 = 1
  ebs_optimized                        = false
  instance_type                        = "t2.medium"
  key_name                             = var.key_name
  metadata_http_endpoint               = "enabled"
  metadata_http_protocol_ipv6          = "disabled"
  metadata_http_put_response_hop_limit = 2
  metadata_http_tokens                 = "required"
  metadata_instance_metadata_tags      = "disabled"
  monitoring_enabled                   = false
  private_ip_address                   = "10.0.0.52"
  root_delete_on_termination           = true
  root_volume_type                     = "gp2"
  security_group_ids                   = var.security_group_ids
  source_dest_check                    = true
  subnet_id                            = var.subnet_id
  tenancy                              = "default"

  tags = {
    "Name" = "taher-private-runner-ubuntu"
  }
}