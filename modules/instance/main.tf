resource "aws_instance" "this" {
  for_each = var.instances

  ami                         = each.value.ami_id
  instance_type               = each.value.instance_type
  availability_zone           = each.value.availability_zone
  key_name                    = each.value.key_name
  subnet_id                   = each.value.subnet_id
  vpc_security_group_ids      = each.value.security_group_ids
  associate_public_ip_address = each.value.associate_public_ip_address
  source_dest_check           = each.value.source_dest_check
  ebs_optimized               = each.value.ebs_optimized
  monitoring                  = each.value.monitoring
  tenancy                     = each.value.tenancy

  capacity_reservation_specification {
    capacity_reservation_preference = each.value.capacity_reservation_preference
  }

  cpu_options {
    core_count       = each.value.cpu_core_count
    threads_per_core = each.value.cpu_threads_per_core
  }

  enclave_options {
    enabled = each.value.enclave_enabled
  }

  metadata_options {
    http_endpoint               = each.value.metadata_http_endpoint
    http_protocol_ipv6          = each.value.metadata_http_protocol_ipv6
    http_put_response_hop_limit = each.value.metadata_http_put_response_hop_limit
    http_tokens                 = each.value.metadata_http_tokens
    instance_metadata_tags      = each.value.metadata_instance_metadata_tags
  }

  dynamic "root_block_device" {
    for_each = each.value.root_delete_on_termination != null || each.value.root_volume_type != null ? [1] : []
    content {
      delete_on_termination = each.value.root_delete_on_termination
      volume_type           = each.value.root_volume_type
    }
  }

  tags = each.value.tags
}