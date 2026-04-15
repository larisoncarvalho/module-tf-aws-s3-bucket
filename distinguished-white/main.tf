module "private_runner" {
  source = "./modules/instance"

  ami_id                          = "ami-04f9a173520f395dd"
  instance_type                   = "t2.large"
  availability_zone               = "eu-central-1a"
  subnet_id                       = var.subnet_id
  security_group_ids              = var.security_group_ids
  iam_instance_profile_name       = var.iam_instance_profile_name
  key_name                        = "private-runner-workshop"
  ebs_optimized                   = false
  monitoring_enabled              = false
  source_dest_check               = true
  tenancy                         = "default"
  hibernation_enabled             = false
  enclave_enabled                 = false
  metadata_http_endpoint          = "enabled"
  metadata_http_tokens            = "required"
  metadata_hop_limit              = 2
  metadata_http_protocol_ipv6     = "disabled"
  metadata_instance_tags          = "disabled"
  capacity_reservation_preference = "open"
  root_delete_on_termination      = true
  cpu_core_count                  = 2
  cpu_threads_per_core            = 1
  tags = {
    Name = "private-runner-do-not-delete"
  }
}