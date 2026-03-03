resource "aws_launch_template" "runner" {
  ebs_optimized = false
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  name_prefix   = "SG_RUNNER_new-private-runner-"

  iam_instance_profile {
    arn = var.iam_instance_profile_arn
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  monitoring {
    enabled = false
  }

  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    device_index                = 0
    security_groups             = var.security_group_ids
    subnet_id                   = var.subnet_id
  }

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      delete_on_termination = true
      volume_size           = 8
      volume_type           = "gp3"
      encrypted             = true
    }
  }

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      delete_on_termination = false
      volume_size           = 8
      volume_type           = "gp3"
      encrypted             = true
    }
  }
}