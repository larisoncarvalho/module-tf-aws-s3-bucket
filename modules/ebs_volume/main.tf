resource "aws_ebs_volume" "this" {
  availability_zone    = var.availability_zone
  encrypted            = var.encrypted
  iops                 = var.iops
  multi_attach_enabled = var.multi_attach_enabled
  size                 = var.size
  snapshot_id          = var.snapshot_id
  type                 = var.volume_type
  tags                 = var.tags
}