region = "eu-central-1"

vpc_vpc_name = {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "vpc_name"
  }
}

subnet_vpc_name_public_eu_central_1a = {
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "vpc_name-public-eu-central-1a"
  }
}

security_group_6y8ixgma = {
  name        = "6y8ixgma"
  description = "Security group for K3s cluster"
  rules = {
    ingress_6443 = {
      type        = "ingress"
      from_port   = 6443
      to_port     = 6443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress_22 = {
      type        = "ingress"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    egress_all = {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

instance_6y8ixgma = {
  ami               = "ami-0a854fe96e0b45e4e"
  instance_type     = "t3.medium"
  availability_zone = "eu-central-1a"
  key_name          = "6y8ixgma"
  source_dest_check = true
  ebs_optimized     = false
  monitoring        = false
  ebs_volume_size   = 8
  ebs_volume_type   = "gp2"
  ebs_volume_iops   = 100
  ebs_snapshot_id   = "snap-090348d671db5375e"
  ebs_encrypted     = false
  ebs_device_name   = "/dev/sda1"
}