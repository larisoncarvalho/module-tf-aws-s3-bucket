resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = var.associate_public_ip_address
  source_dest_check           = var.source_dest_check
  ebs_optimized               = var.ebs_optimized
  monitoring                  = var.monitoring
  tenancy                     = var.tenancy
  cpu_core_count              = var.cpu_core_count
  cpu_threads_per_core        = var.cpu_threads_per_core
  tags                        = var.tags

  metadata_options {
    http_endpoint               = var.metadata_options.http_endpoint
    http_tokens                 = var.metadata_options.http_tokens
    http_put_response_hop_limit = var.metadata_options.http_put_response_hop_limit
    http_protocol_ipv6          = var.metadata_options.http_protocol_ipv6
    instance_metadata_tags      = var.metadata_options.instance_metadata_tags
  }

  enclave_options {
    enabled = var.enclave_options_enabled
  }
}