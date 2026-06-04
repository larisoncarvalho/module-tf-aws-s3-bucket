# Module: network_interface
# Manages a single aws_network_interface resource. Attachment metadata
# (device_index, instance association) is managed by aws_instance and
# is intentionally omitted here to avoid conflicts.

resource "aws_network_interface" "this" {
  subnet_id         = var.subnet_id
  private_ips       = var.private_ips
  security_groups   = var.security_groups
  source_dest_check = var.source_dest_check
  description       = var.description
  tags              = var.tags
}
