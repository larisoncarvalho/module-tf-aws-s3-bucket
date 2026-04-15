module "acm_certificate" {
  source = "./modules/acm_certificate"

  domain_name = "stackguardian.io"
  subject_alternative_names = [
    "*.qa.stackguardian.io",
    "*.stackguardian.io"
  ]
  tags = {
    Resource-Type = "prod"
    Name          = "sg"
  }
}

module "athena_workgroup" {
  source = "./modules/athena_workgroup"

  workgroup_name                     = "primary"
  state                              = "ENABLED"
  enforce_workgroup_configuration    = false
  publish_cloudwatch_metrics_enabled = false
  requester_pays_enabled             = false
}

module "backup_vault" {
  source = "./modules/backup_vault"

  vault_name    = "Default"
  kms_key_arn   = var.backup_vault_kms_key_arn
  vault_policy  = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "backup:CopyIntoBackupVault"
        Resource  = "*"
        Condition = {
          StringEquals = {
            "aws:PrincipalOrgID" = "o-ohixe8qfps"
          }
        }
      }
    ]
  })
}

module "autoscaling_group" {
  source = "./modules/autoscaling_group"

  asg_name                    = "taher-private-runner"
  max_size                    = 5
  min_size                    = 0
  desired_capacity            = 1
  health_check_grace_period   = 300
  health_check_type           = "EC2"
  vpc_zone_identifier         = [var.taher_runner_subnet_id]
  launch_template_id          = var.taher_runner_launch_template_id
  launch_template_version     = "$Latest"
  default_cooldown            = 300
  termination_policies        = ["Default"]
  protect_from_scale_in       = false
  service_linked_role_arn     = var.autoscaling_service_linked_role_arn
}

module "instance_i_0439c48efdf4ad956" {
  source = "./modules/instance"

  ami_id                     = var.instance_ami_id
  instance_type              = "t3.micro"
  availability_zone          = "eu-central-1a"
  key_name                   = var.instance_key_name
  vpc_security_group_ids     = [var.instance_security_group_id]
  subnet_id                  = var.instance_subnet_id
  ebs_optimized              = false
  monitoring                 = false
  source_dest_check          = true
  root_volume_type           = "gp2"
  root_volume_size           = 8
  root_delete_on_termination = true
  metadata_http_endpoint     = "enabled"
  metadata_http_tokens       = "optional"
  metadata_hop_limit         = 1
}

module "network_interface_eni_02b2519b0f908256d" {
  source = "./modules/network_interface"

  subnet_id         = var.eni_subnet_id
  private_ips       = ["10.0.0.237"]
  security_groups   = [var.eni_security_group_id]
  source_dest_check = true
}

module "security_group_ec2_sg_v815bfuv" {
  source = "./modules/security_group"

  security_group_name = "ec2-sg-v815bfuv"
  description         = "Security group for EC2 instance - SSH access"
  vpc_id              = var.vpc_id
  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "SSH"
    }
  ]
  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "All outbound traffic"
    }
  ]
}

module "subnet_vpc_name_public_eu_central_1a" {
  source = "./modules/subnet"

  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "vpc_name-public-eu-central-1a"
  }
}

module "vpc_vpc_name" {
  source = "./modules/vpc"

  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "vpc_name"
  }
}

module "iam_policy_ebs_csi" {
  source = "./modules/iam_policy"

  policy_name = "AmazonEKS_EBS_CSI_Policy-20250326152907321400000002"
  path        = "/"
  policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:ModifyVolume",
          "ec2:EnableFastSnapshotRestores",
          "ec2:DetachVolume",
          "ec2:DescribeVolumesModifications",
          "ec2:DescribeVolumes",
          "ec2:DescribeTags",
          "ec2:DescribeSnapshots",
          "ec2:DescribeInstances",
          "ec2:DescribeAvailabilityZones",
          "ec2:CreateSnapshot",
          "ec2:AttachVolume"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = "ec2:CreateTags"
        Resource = [
          "arn:aws:ec2:*:*:volume/*",
          "arn:aws:ec2:*:*:snapshot/*"
        ]
        Condition = {
          StringEquals = {
            "ec2:CreateAction" = ["CreateVolume", "CreateSnapshot"]
          }
        }
      },
      {
        Effect = "Allow"
        Action = "ec2:DeleteTags"
        Resource = [
          "arn:aws:ec2:*:*:volume/*",
          "arn:aws:ec2:*:*:snapshot/*"
        ]
      },
      {
        Effect = "Allow"
        Action = "ec2:CreateVolume"
        Resource = "arn:aws:ec2:*:*:volume/*"
        Condition = {
          StringLike = {
            "aws:RequestTag/ebs.csi.aws.com/cluster" = "true"
          }
        }
      },
      {
        Effect = "Allow"
        Action = "ec2:CreateVolume"
        Resource = "arn:aws:ec2:*:*:volume/*"
        Condition = {
          StringLike = {
            "aws:RequestTag/CSIVolumeName" = "*"
          }
        }
      },
      {
        Effect = "Allow"
        Action = "ec2:CreateVolume"
        Resource = "*"
        Condition = {
          StringLike = {
            "aws:RequestTag/kubernetes.io/cluster/*" = "owned"
          }
        }
      },
      {
        Effect   = "Allow"
        Action   = "ec2:CreateVolume"
        Resource = "arn:aws:ec2:*:*:snapshot/*"
      },
      {
        Effect = "Allow"
        Action = "ec2:DeleteVolume"
        Resource = "*"
        Condition = {
          StringLike = {
            "ec2:ResourceTag/ebs.csi.aws.com/cluster" = "true"
          }
        }
      },
      {
        Effect = "Allow"
        Action = "ec2:DeleteVolume"
        Resource = "*"
        Condition = {
          StringLike = {
            "ec2:ResourceTag/CSIVolumeName" = "*"
          }
        }
      },
      {
        Effect = "Allow"
        Action = "ec2:DeleteVolume"
        Resource = "*"
        Condition = {
          StringLike = {
            "ec2:ResourceTag/kubernetes.io/cluster/*" = "owned"
          }
        }
      },
      {
        Effect = "Allow"
        Action = "ec2:DeleteVolume"
        Resource = "*"
        Condition = {
          StringLike = {
            "ec2:ResourceTag/kubernetes.io/created-for/pvc/name" = "*"
          }
        }
      },
      {
        Effect = "Allow"
        Action = "ec2:DeleteSnapshot"
        Resource = "*"
        Condition = {
          StringLike = {
            "ec2:ResourceTag/CSIVolumeSnapshotName" = "*"
          }
        }
      },
      {
        Effect = "Allow"
        Action = "ec2:DeleteSnapshot"
        Resource = "*"
        Condition = {
          StringLike = {
            "ec2:ResourceTag/ebs.csi.aws.com/cluster" = "true"
          }
        }
      }
    ]
  })
}