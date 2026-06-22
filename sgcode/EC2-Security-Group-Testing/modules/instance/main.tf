resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  availability_zone      = var.availability_zone
  source_dest_check      = var.source_dest_check
  ebs_optimized          = var.ebs_optimized
  monitoring             = var.monitoring
  tags                   = var.tags

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
    http_protocol_ipv6          = "disabled"
    instance_metadata_tags      = "disabled"
  }
}
