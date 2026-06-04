# Module: ebs_volume
# Manages a single aws_ebs_volume resource. All volume-specific values
# (size, type, availability zone, etc.) are exposed as variables.

resource "aws_ebs_volume" "this" {
  availability_zone = var.availability_zone
  size              = var.size
  type              = var.type
  iops              = var.iops
  throughput        = var.throughput
  encrypted         = var.encrypted
  snapshot_id       = var.snapshot_id
  tags              = var.tags
}
