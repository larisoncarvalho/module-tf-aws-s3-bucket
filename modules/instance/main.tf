resource "aws_instance" "this" {
  for_each = var.instances

  ami                    = each.value.ami_id
  availability_zone      = each.value.availability_zone
  ebs_optimized          = each.value.ebs_optimized
  instance_type          = each.value.instance_type
  key_name               = each.value.key_name
  monitoring             = each.value.monitoring
  private_ip             = each.value.private_ip
  source_dest_check      = each.value.source_dest_check
  subnet_id              = each.value.subnet_id
  tenancy                = each.value.tenancy
  vpc_security_group_ids = each.value.vpc_security_group_ids

  metadata_options {
    http_endpoint               = each.value.metadata_options.http_endpoint
    http_put_response_hop_limit = each.value.metadata_options.http_put_response_hop_limit
    http_tokens                 = each.value.metadata_options.http_tokens
    instance_metadata_tags      = each.value.metadata_options.instance_metadata_tags
  }

  root_block_device {
    delete_on_termination = each.value.root_block_device.delete_on_termination
    volume_type           = each.value.root_block_device.volume_type
  }

  tags = each.value.tags
}