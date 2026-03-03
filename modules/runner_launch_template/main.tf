resource "aws_launch_template" "runner" {
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  name_prefix   = "SG_RUNNER_new-private-runner-"
  user_data     = var.user_data

  iam_instance_profile {
    name = var.iam_instance_profile_name
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
  }

  network_interfaces {
    associate_public_ip_address = true
    device_index                = 0
    security_groups             = var.security_group_ids
  }

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 100
      volume_type = "gp3"
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = var.instance_name_tag
    }
  }
}