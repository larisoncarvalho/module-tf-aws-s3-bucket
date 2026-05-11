resource "aws_instance" "this" {
  ami                    = var.ami
  availability_zone      = var.availability_zone
  ebs_optimized          = var.ebs_optimized
  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = var.monitoring
  source_dest_check      = var.source_dest_check
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
}

resource "aws_ebs_volume" "this" {
  availability_zone = var.availability_zone
  encrypted         = var.ebs_encrypted
  iops              = var.ebs_volume_iops
  size              = var.ebs_volume_size
  snapshot_id       = var.ebs_snapshot_id
  type              = var.ebs_volume_type
}

resource "aws_volume_attachment" "this" {
  device_name = var.ebs_device_name
  instance_id = aws_instance.this.id
  volume_id   = aws_ebs_volume.this.id
}