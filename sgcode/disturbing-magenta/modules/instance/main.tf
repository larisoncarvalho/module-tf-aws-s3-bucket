# Module: instance
# Manages a single aws_instance resource plus its metadata_options and
# root_block_device configuration. All instance-specific values are variables.

resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  availability_zone      = var.availability_zone
  monitoring             = var.monitoring
  ebs_optimized          = var.ebs_optimized
  source_dest_check      = var.source_dest_check
  tenancy                = var.tenancy

  metadata_options {
    http_endpoint               = var.metadata_http_endpoint
    http_put_response_hop_limit = var.metadata_http_put_response_hop_limit
    http_tokens                 = var.metadata_http_tokens
    instance_metadata_tags      = var.metadata_instance_metadata_tags
    http_protocol_ipv6          = var.metadata_http_protocol_ipv6
  }

  root_block_device {
    delete_on_termination = var.root_delete_on_termination
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size
    iops                  = var.root_iops
    throughput            = var.root_throughput
  }

  tags = var.tags
}
