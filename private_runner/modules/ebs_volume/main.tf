resource "aws_ebs_volume" "this" {
  availability_zone    = var.availability_zone
  size                 = var.size
  type                 = var.volume_type
  iops                 = var.iops
  throughput           = var.throughput
  encrypted            = var.encrypted
  multi_attach_enabled = var.multi_attach_enabled
  tags                 = var.tags
}
