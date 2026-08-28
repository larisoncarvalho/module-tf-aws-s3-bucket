resource "aws_network_interface" "this" {
  subnet_id         = var.subnet_id
  security_groups   = var.security_groups
  description       = var.description
  private_ips       = var.private_ips
  source_dest_check = var.source_dest_check
  tags              = var.tags
}
