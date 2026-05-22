module "autoscaling_group" {
  source = "./modules/autoscaling_group"

  name                      = var.name
  max_size                  = var.max_size
  min_size                  = var.min_size
  desired_capacity          = var.desired_capacity
  default_cooldown          = var.default_cooldown
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  protect_from_scale_in     = var.protect_from_scale_in
  service_linked_role_arn   = var.service_linked_role_arn
  termination_policies      = var.termination_policies
  vpc_zone_identifier       = var.vpc_zone_identifier
  launch_template_id        = var.launch_template_id
  launch_template_version   = var.launch_template_version
}