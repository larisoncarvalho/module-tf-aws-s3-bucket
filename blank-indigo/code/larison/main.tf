module "instance" {
  source = "./modules/instance"

  ami_id                               = "ami-03074cc1b166e8691"
  instance_type                        = "t2.medium"
  availability_zone                    = "eu-central-1a"
  subnet_id                            = var.subnet_id
  security_group_ids                   = var.security_group_ids
  key_name                             = "taher-private-runner"
  private_ip_address                   = "10.0.0.37"
  source_dest_check                    = true
  ebs_optimized                        = false
  monitoring_enabled                   = false
  tenancy                              = "default"
  hibernation_enabled                  = false
  enclave_enabled                      = false
  metadata_http_endpoint               = "enabled"
  metadata_http_tokens                 = "required"
  metadata_http_put_response_hop_limit = 2
  metadata_http_protocol_ipv6          = "disabled"
  metadata_instance_metadata_tags      = "disabled"
  capacity_reservation_preference      = "open"
  root_volume_type                     = var.root_volume_type
  root_delete_on_termination           = true
}