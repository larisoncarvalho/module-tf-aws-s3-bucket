resource "aws_network_interface" "this" {
  subnet_id         = var.subnet_id
  private_ips       = [var.private_ip_address]
  security_groups   = [var.security_group_id]
  source_dest_check = var.source_dest_check
}