resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  source_dest_check      = var.source_dest_check
  ebs_optimized          = var.ebs_optimized

  root_block_device {
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size
    iops                  = var.root_volume_iops
    throughput            = var.root_volume_throughput
    delete_on_termination = var.root_volume_delete_on_termination
    encrypted             = var.root_volume_encrypted
  }

  metadata_options {
    http_endpoint               = var.metadata_http_endpoint
    http_tokens                 = var.metadata_http_tokens
    http_put_response_hop_limit = var.metadata_http_put_response_hop_limit
    http_protocol_ipv6          = var.metadata_http_protocol_ipv6
    instance_metadata_tags      = var.metadata_instance_metadata_tags
  }

  tags = var.tags
}
