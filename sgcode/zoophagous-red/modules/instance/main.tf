resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = var.public_key
}

resource "aws_instance" "this" {
  ami                    = var.ami_id
  availability_zone      = var.availability_zone
  ebs_optimized          = var.ebs_optimized
  instance_type          = var.instance_type
  key_name               = aws_key_pair.this.key_name
  monitoring             = var.monitoring_enabled
  private_ip             = var.private_ip_address
  source_dest_check      = var.source_dest_check
  subnet_id              = var.subnet_id
  tenancy                = var.tenancy
  vpc_security_group_ids = var.security_group_ids

  cpu_core_count       = var.cpu_core_count
  cpu_threads_per_core = var.cpu_threads_per_core

  root_block_device {
    delete_on_termination = var.root_delete_on_termination
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
  }

  metadata_options {
    http_endpoint               = var.metadata_http_endpoint
    http_protocol_ipv6          = var.metadata_http_protocol_ipv6
    http_put_response_hop_limit = var.metadata_http_put_response_hop_limit
    http_tokens                 = var.metadata_http_tokens
    instance_metadata_tags      = var.metadata_instance_metadata_tags
  }

  enclave_options {
    enabled = var.enclave_enabled
  }

  hibernation_options {
    configured = var.hibernation_configured
  }

  capacity_reservation_specification {
    capacity_reservation_preference = var.capacity_reservation_preference
  }

  tags = var.tags
}