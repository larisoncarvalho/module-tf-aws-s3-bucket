module "taher_private_runner_ubuntu" {
  source = "./modules/ec2_instance"

  ami_id                               = "ami-03250b0e01c28d196"
  instance_type                        = "t2.medium"
  availability_zone                    = "eu-central-1a"
  key_name                             = "taher-private-runner"
  subnet_id                            = var.subnet_id
  security_group_ids                   = var.security_group_ids
  private_ip                           = "10.0.0.52"
  source_dest_check                    = true
  ebs_optimized                        = false
  monitoring                           = false
  tenancy                              = "default"
  root_volume_type                     = "gp2"
  root_delete_on_termination           = true
  metadata_http_endpoint               = "enabled"
  metadata_http_tokens                 = "required"
  metadata_http_put_response_hop_limit = 2
  metadata_http_protocol_ipv6          = "disabled"
  metadata_instance_metadata_tags      = "disabled"
  enclave_enabled                      = false
  cpu_core_count                       = 2
  cpu_threads_per_core                 = 1
  capacity_reservation_preference      = "open"
  tags = {
    Name = "taher-private-runner-ubuntu"
  }
}