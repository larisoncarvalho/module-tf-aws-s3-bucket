resource "aws_ebs_volume" "root" {
  availability_zone = var.availability_zone
  size              = var.root_volume_size
  type              = "gp2"
  iops              = 150
  encrypted         = false
  snapshot_id       = "snap-020690036533329c3"

  tags = {
    Name = "vol-0972b44b3d0cb86f9"
  }
}

resource "aws_ebs_volume" "data" {
  availability_zone = var.availability_zone
  size              = var.data_volume_size
  type              = "gp3"
  iops              = 3000
  throughput        = 125
  encrypted         = false

  tags = {
    Name = "vol-0f5a54343d85c2ca9"
  }
}

resource "aws_volume_attachment" "root" {
  device_name  = "/dev/xvda"
  volume_id    = aws_ebs_volume.root.id
  instance_id  = var.instance_id
  force_detach = false
  skip_destroy = false
}

resource "aws_volume_attachment" "data" {
  device_name  = "/dev/sda1"
  volume_id    = aws_ebs_volume.data.id
  instance_id  = var.instance_id
  force_detach = false
  skip_destroy = true
}