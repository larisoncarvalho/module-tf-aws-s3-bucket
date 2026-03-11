region = "eu-central-1"

vpc_sg_nonprod_1 = {
  cidr_block       = "10.0.0.0/24"
  instance_tenancy = "default"
  tags = {
    Name          = "sg-nonprod-1"
    Resource-Type = "nonprod"
  }
}

subnet_app_a = {
  cidr_block                      = "10.0.0.32/27"
  availability_zone               = "eu-central-1a"
  map_public_ip_on_launch         = false
  assign_ipv6_address_on_creation = false
  ipv6_cidr_block                 = "2a05:d014:190:c620::/64"
  tags = {
    Name          = "app-a"
    Resource-Type = "nonprod"
  }
}

security_group_default = {
  name        = "default"
  description = "default VPC security group"
  tags = {
    Name = "default"
  }
  rules = {
    ingress_self_all = {
      type     = "ingress"
      protocol = "-1"
      self     = true
    }
    ingress_ssh_172_16 = {
      type        = "ingress"
      protocol    = "tcp"
      from_port   = 22
      to_port     = 22
      cidr_blocks = ["172.16.0.0/24"]
    }
    ingress_uptime_kuma = {
      type        = "ingress"
      protocol    = "tcp"
      from_port   = 3001
      to_port     = 3001
      cidr_blocks = ["172.16.0.0/24"]
      description = "uptime-kuma"
    }
    egress_all_ipv4 = {
      type        = "egress"
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
    egress_all_ipv6 = {
      type             = "egress"
      protocol         = "-1"
      ipv6_cidr_blocks = ["::/0"]
    }
  }
}

key_pair_nonprod_euc1 = {
  key_name = "nonprod-euc1"
}

iam_role_amazonec2containerserviceforec2role = {
  name = "AmazonEC2ContainerServiceforEC2Role"
  path = "/"
  assume_role_policy = {
    Version = "2008-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = [
            "arn:aws:iam::790543352839:root",
            "arn:aws:iam::756925330322:root"
          ]
        }
        Action = "sts:AssumeRole"
      },
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  }
}

iam_instance_profile_amazonec2containerserviceforec2role = {
  name = "AmazonEC2ContainerServiceforEC2Role"
  path = "/"
}

ebs_volume_vol_0829d737221ed9b5a = {
  availability_zone    = "eu-central-1a"
  encrypted            = false
  iops                 = 100
  multi_attach_enabled = false
  size                 = 30
  snapshot_id          = "snap-0427afb38a955d4cc"
  volume_type          = "gp2"
  tags = {
    Resource-Type = "nonprod"
  }
}

network_interface_eni_03f18c266f4ca136e = {
  private_ips       = ["10.0.0.57"]
  source_dest_check = true
  tags = {
    Resource-Type = "nonprod"
  }
}

instance_ecs_instances_admin_workflow_qa = {
  ami                                  = "ami-0f37a3fdaaaf3661e"
  instance_type                        = "t2.medium"
  availability_zone                    = "eu-central-1a"
  ebs_optimized                        = false
  monitoring                           = false
  source_dest_check                    = true
  tenancy                              = "default"
  root_volume_type                     = "gp2"
  root_volume_size                     = 30
  root_delete_on_termination           = true
  metadata_http_endpoint               = "enabled"
  metadata_http_put_response_hop_limit = 1
  metadata_http_tokens                 = "optional"
  metadata_instance_metadata_tags      = "disabled"
  tags = {
    Name                          = "ecs-instances-admin-workflow-qa"
    Resource-Type                 = "nonprod"
    "aws:autoscaling:groupName"   = "ecs-instances-admin-workflow-qa"
    "aws:ec2launchtemplate:id"    = "lt-0f212ff506c4e1680"
    "aws:ec2launchtemplate:version" = "10"
  }
}