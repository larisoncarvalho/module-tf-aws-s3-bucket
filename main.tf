module "launch_template" {
  source = "./modules/launch_template"

  launch_template_name = "Neha_Private_Runner-private-runner-20251104133103018200000001"
}

module "autoscaling_group" {
  source = "./modules/autoscaling_group"

  name                                  = "Neha_Private_Runner-private-runner-asg"
  availability_zones                    = ["eu-central-1a"]
  default_cooldown                      = 300
  desired_capacity                      = 1
  health_check_grace_period             = 300
  health_check_type                     = "EC2"
  max_size                              = 3
  min_size                              = 1
  new_instances_protected_from_scale_in = false
  service_linked_role_arn               = var.service_linked_role_arn
  termination_policies                  = ["Default"]
  vpc_zone_identifier                   = var.subnet_id
  launch_template_id                    = module.launch_template.id
  launch_template_version               = "$Latest"
}