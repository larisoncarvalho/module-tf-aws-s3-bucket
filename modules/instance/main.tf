resource "aws_instance" "this" {
  ami                  = var.ami
  availability_zone    = var.availability_zone
  ebs_optimized        = var.ebs_optimized
  iam_instance_profile = var.iam_instance_profile
  instance_type        = var.instance_type
  key_name             = var.key_name
  monitoring           = var.monitoring
  source_dest_check    = var.source_dest_check
  tenancy              = var.tenancy
  tags                 = var.tags

  network_interface {
    delete_on_termination = false
    device_index          = 0
    network_interface_id  = var.network_interface_id
  }

  root_block_device {
    delete_on_termination = var.root_delete_on_termination
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
  }

  metadata_options {
    http_endpoint               = var.metadata_http_endpoint
    http_put_response_hop_limit = var.metadata_http_put_response_hop_limit
    http_tokens                 = var.metadata_http_tokens
    instance_metadata_tags      = var.metadata_instance_metadata_tags
  }
}