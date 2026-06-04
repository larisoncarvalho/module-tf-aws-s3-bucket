# Volume carved from stone
# encrypted bytes persist long—
# data outlives hosts

resource "aws_ebs_volume" "this" {
  availability_zone    = var.availability_zone
  encrypted            = var.encrypted
  iops                 = var.iops
  multi_attach_enabled = var.multi_attach_enabled
  size                 = var.size
  snapshot_id          = var.snapshot_id
  throughput           = var.throughput
  type                 = var.type
}