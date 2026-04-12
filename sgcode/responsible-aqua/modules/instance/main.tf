resource "aws_network_interface" "this" {
  private_ips       = [var.private_ip_address]
  security_groups   = var.security_group_ids
  source_dest_check = var.source_dest_check
  subnet_id         = var.subnet_id
}

resource "aws_instance" "this" {
  ami            = var.ami_id
  ebs_optimized  = var.ebs_optimized
  hibernation    = var.hibernation
  instance_type  = var.instance_type
  key_name       = var.key_name
  monitoring     = var.monitoring
  tenancy        = var.tenancy

  tags = {
    Name = var.instance_name_tag
  }

  capacity_reservation_specification {
    capacity_reservation_preference = var.capacity_reservation_preference
  }

  cpu_options {
    core_count       = var.cpu_core_count
    threads_per_core = var.cpu_threads_per_core
  }

  enclave_options {
    enabled = var.enclave_options_enabled
  }

  metadata_options {
    http_endpoint               = var.metadata_http_endpoint
    http_put_response_hop_limit = var.metadata_http_put_response_hop_limit
    http_tokens                 = var.metadata_http_tokens
  }

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.this.id
  }

  root_block_device {
    delete_on_termination = var.root_block_device_delete_on_termination
  }
}