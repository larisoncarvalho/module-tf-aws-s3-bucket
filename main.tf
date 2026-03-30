module "neha_private_runner_asg" {
  source = "./modules/autoscaling_group"

  default_cooldown          = var.neha_private_runner_asg.default_cooldown
  desired_capacity          = var.neha_private_runner_asg.desired_capacity
  health_check_grace_period = var.neha_private_runner_asg.health_check_grace_period
  health_check_type         = var.neha_private_runner_asg.health_check_type
  launch_template_id        = var.neha_private_runner_asg.launch_template_id
  launch_template_version   = var.neha_private_runner_asg.launch_template_version
  max_size                  = var.neha_private_runner_asg.max_size
  min_size                  = var.neha_private_runner_asg.min_size
  name                      = var.neha_private_runner_asg.name
  termination_policies      = var.neha_private_runner_asg.termination_policies
  vpc_zone_identifier       = var.neha_private_runner_asg.vpc_zone_identifier
}

module "ec2_instances" {
  source   = "./modules/instance"
  for_each = var.ec2_instances

  ami                         = each.value.ami
  associate_public_ip_address = each.value.associate_public_ip_address
  availability_zone           = each.value.availability_zone
  ebs_optimized               = each.value.ebs_optimized
  instance_type               = each.value.instance_type
  key_name                    = each.value.key_name
  metadata_options            = each.value.metadata_options
  monitoring                  = each.value.monitoring
  source_dest_check           = each.value.source_dest_check
  subnet_id                   = each.value.subnet_id
  tenancy                     = each.value.tenancy
  vpc_security_group_ids      = each.value.vpc_security_group_ids
}