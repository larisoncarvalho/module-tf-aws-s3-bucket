resource "aws_efs_mount_target" "this" {
  for_each = var.mount_targets

  file_system_id  = var.file_system_id
  ip_address      = each.value.ip_address
  security_groups = each.value.security_groups
  subnet_id       = each.value.subnet_id
}