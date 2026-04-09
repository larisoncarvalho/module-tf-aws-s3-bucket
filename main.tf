module "runner_asg" {
  source = "./modules/autoscaling_group"

  name                      = "SG_RUNNER_new-private-runner-asg"
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  launch_template_id        = var.launch_template_id
  launch_template_version   = "$Latest"
  max_size                  = 5
  min_size                  = 1
  vpc_zone_identifier       = [var.subnet_id]
  termination_policies      = []
  test = 1
}