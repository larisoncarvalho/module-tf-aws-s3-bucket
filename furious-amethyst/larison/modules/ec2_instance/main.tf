resource "aws_instance" "this" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  availability_zone    = var.availability_zone
  key_name             = var.key_name
  subnet_id            = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  private_ip           = var.private_ip
  source_dest_check    = var.source_dest_check
  ebs_optimized        = var.ebs_optimized
  monitoring           = var.monitoring
  tenancy              = var.tenancy
  
  cpu_core_count       = var.cpu_core_count
  cpu_threads_per_core = var.cpu_threads_per_core
  
  hibernation          = var.hibernation
  
  enclave_options {
    enabled = var.enclave_enabled
  }
  
  capacity_reservation_specification {
    capacity_reservation_preference = var.capacity_reservation_preference
  }
  
  metadata_options {
    http_endpoint               = var.metadata_http_endpoint
    http_tokens                 = var.metadata_http_tokens
    http_put_response_hop_limit = var.metadata_http_put_response_hop_limit
    http_protocol_ipv6          = var.metadata_http_protocol_ipv6
    instance_metadata_tags      = var.metadata_instance_tags
  }
  
  root_block_device {
    volume_type           = var.root_volume_type
    delete_on_termination = var.root_delete_on_termination
  }
  
  tags = var.tags
}