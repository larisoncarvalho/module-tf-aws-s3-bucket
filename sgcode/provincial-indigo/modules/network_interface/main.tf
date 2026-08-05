resource "aws_network_interface" "this" {
  subnet_id         = var.subnet_id
  private_ips       = var.private_ips
  security_groups   = var.security_group_ids
  source_dest_check = var.source_dest_check

  attachment {
    instance     = var.instance_id
    device_index = var.device_index
  }
}