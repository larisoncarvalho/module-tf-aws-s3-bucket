resource "aws_instance" "this" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  availability_zone    = var.availability_zone
  subnet_id            = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  iam_instance_profile = var.iam_instance_profile_arn
  key_name             = var.key_name

  cpu_core_count       = var.cpu_core_count
  cpu_threads_per_core = var.cpu_threads_per_core
  ebs_optimized        = var.ebs_optimized
  hibernation          = var.hibernation_enabled
  monitoring           = var.monitoring_enabled
  source_dest_check    = var.source_dest_check
  tenancy              = var.tenancy

  capacity_reservation_specification {
    capacity_reservation_preference = var.capacity_reservation_preference
  }

  enclave_options {
    enabled = var.enclave_enabled
  }

  metadata_options {
    http_endpoint               = var.metadata_http_endpoint
    http_protocol_ipv6          = var.metadata_http_protocol_ipv6
    http_put_response_hop_limit = var.metadata_hop_limit
    http_tokens                 = var.metadata_http_tokens
    instance_metadata_tags      = var.metadata_instance_tags
  }

  root_block_device {
    delete_on_termination = var.root_delete_on_termination
  }

  tags = var.tags
}