resource "aws_network_interface" "this" {
  subnet_id         = var.subnet_id
  security_groups   = var.security_groups
  source_dest_check = var.source_dest_check
  description       = var.description
  tags              = var.tags
}
