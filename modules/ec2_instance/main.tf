resource "aws_instance" "this" {
  ami                         = var.ami_id
  availability_zone           = var.availability_zone
  ebs_optimized              = var.ebs_optimized
  hibernation                = var.hibernation
  instance_type              = var.instance_type
  key_name                   = var.key_name
  monitoring                 = var.monitoring
  source_dest_check          = var.source_dest_check
  subnet_id                  = var.subnet_id
  tenancy                    = var.tenancy
  vpc_security_group_ids     = var.vpc_security_group_ids

  capacity_reservation_specification {
    capacity_reservation_preference = var.capacity_reservation_preference
  }

  enclave_options {
    enabled = var.enclave_enabled
  }

  metadata_options {
    http_endpoint               = var.metadata_http_endpoint
    http_put_response_hop_limit = var.metadata_http_put_response_hop_limit
    http_tokens                 = var.metadata_http_tokens
    instance_metadata_tags      = var.metadata_instance_metadata_tags
  }

  root_block_device {
    delete_on_termination = var.root_delete_on_termination
  }
}