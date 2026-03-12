resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  ebs_optimized          = var.ebs_optimized
  key_name               = var.key_name
  monitoring             = var.monitoring
  source_dest_check      = var.source_dest_check
  subnet_id              = var.subnet_id
  tenancy                = var.tenancy
  vpc_security_group_ids = var.vpc_security_group_ids

  enclave_options {
    enabled = var.enclave_options_enabled
  }

  metadata_options {
    http_endpoint               = var.metadata_options.http_endpoint
    http_protocol_ipv6          = var.metadata_options.http_protocol_ipv6
    http_put_response_hop_limit = var.metadata_options.http_put_response_hop_limit
    http_tokens                 = var.metadata_options.http_tokens
    instance_metadata_tags      = var.metadata_options.instance_metadata_tags
  }

  tags = var.tags
}