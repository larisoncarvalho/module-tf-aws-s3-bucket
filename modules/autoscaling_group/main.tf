resource "aws_autoscaling_group" "this" {
  availability_zones        = var.availability_zones
  default_cooldown          = var.default_cooldown
  desired_capacity          = var.desired_capacity
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  max_size                  = var.max_size
  min_size                  = var.min_size
  name                      = var.name
  termination_policies      = var.termination_policies
  vpc_zone_identifier       = var.vpc_zone_identifier

  enabled_metrics = []

  launch_template {
    id      = var.launch_template_id
    version = var.launch_template_version
  }

  tag {
    key                 = "Name"
    value               = var.name
    propagate_at_launch = true
  }
}