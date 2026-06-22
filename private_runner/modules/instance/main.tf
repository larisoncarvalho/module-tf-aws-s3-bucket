resource "aws_instance" "this" {
  ami               = var.ami
  instance_type     = var.instance_type
  key_name          = var.key_name
  subnet_id         = var.subnet_id
  availability_zone = var.availability_zone
  tenancy           = var.tenancy
  monitoring        = var.monitoring
  ebs_optimized     = var.ebs_optimized
  source_dest_check = var.source_dest_check

  vpc_security_group_ids = var.vpc_security_group_ids

  dynamic "cpu_options" {
    for_each = var.cpu_core_count != null ? [1] : []
    content {
      core_count       = var.cpu_core_count
      threads_per_core = var.cpu_threads_per_core
    }
  }

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    delete_on_termination = var.root_volume_delete_on_termination
  }

  metadata_options {
    http_endpoint               = var.metadata_http_endpoint
    http_tokens                 = var.metadata_http_tokens
    http_put_response_hop_limit = var.metadata_http_put_response_hop_limit
  }

  tags = var.tags
}
