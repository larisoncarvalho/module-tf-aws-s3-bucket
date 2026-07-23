resource "aws_instance" "this" {
  for_each = var.instances

  ami                    = each.value.ami
  iam_instance_profile   = each.value.iam_instance_profile
  instance_type          = each.value.instance_type
  key_name               = each.value.key_name
  monitoring             = each.value.monitoring
  source_dest_check      = each.value.source_dest_check
  subnet_id              = each.value.subnet_id
  tags                   = each.value.tags
  user_data              = each.value.user_data
  vpc_security_group_ids = each.value.vpc_security_group_ids

  metadata_options {
    http_endpoint               = each.value.metadata_options.http_endpoint
    http_put_response_hop_limit = each.value.metadata_options.http_put_response_hop_limit
    http_tokens                 = each.value.metadata_options.http_tokens
  }

  root_block_device {
    delete_on_termination = each.value.root_block_device.delete_on_termination
    volume_size           = each.value.root_block_device.volume_size
    volume_type           = each.value.root_block_device.volume_type
  }
}