module "key_pair" {
  source = "./modules/key_pair"

  key_name   = "taher-private-runner"
  public_key = var.key_pair_public_key
}

module "instance" {
  source = "./modules/instance"

  ami_id                       = var.ami_id
  instance_type                = "t2.medium"
  key_name                     = module.key_pair.key_name
  availability_zone            = "eu-central-1a"
  subnet_id                    = var.subnet_id
  security_group_ids           = var.security_group_ids
  private_ip_address           = "10.0.0.52"
  source_dest_check            = true
  ebs_optimized                = false
  monitoring_enabled           = false
  tenancy                      = "default"
  root_volume_type             = "gp2"
  root_delete_on_termination   = true
  metadata_http_endpoint       = "enabled"
  metadata_http_tokens         = "required"
  metadata_hop_limit           = 2
  metadata_http_protocol_ipv6  = "disabled"
  metadata_instance_tags       = "disabled"
  enclave_enabled              = false
  cpu_core_count               = 2
  cpu_threads_per_core         = 1
  tags = {
    Name = "taher-private-runner-ubuntu"
  }
}