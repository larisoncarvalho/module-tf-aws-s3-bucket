resource "aws_autoscaling_group" "this" {
  default_cooldown                = var.default_cooldown
  desired_capacity                = var.desired_capacity
  force_delete                    = false
  force_delete_warm_pool          = false
  health_check_grace_period       = var.health_check_grace_period
  health_check_type               = var.health_check_type
  ignore_failed_scaling_activities = false
  max_size                        = var.max_size
  min_size                        = var.min_size
  name                            = var.name
  termination_policies            = var.termination_policies
  vpc_zone_identifier             = var.vpc_zone_identifier
  wait_for_capacity_timeout       = "10m"

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