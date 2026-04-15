module "ec2_instance" {
  source = "./modules/instance"

  ami_id                                 = var.ami_id
  availability_zone                      = "eu-central-1a"
  cpu_core_count                         = 1
  cpu_threads_per_core                   = 2
  ebs_optimized                          = false
  enclave_enabled                        = false
  instance_type                          = "t3.micro"
  key_name                               = "ec2-key-thz89qha"
  metadata_http_endpoint                 = "enabled"
  metadata_http_protocol_ipv6            = "disabled"
  metadata_http_put_response_hop_limit   = 1
  metadata_http_tokens                   = "optional"
  metadata_instance_metadata_tags        = "disabled"
  monitoring                             = false
  security_group_ids                     = var.security_group_ids
  source_dest_check                      = true
  subnet_id                              = var.subnet_id
  tenancy                                = "default"
}