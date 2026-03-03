module "vpc" {
  source = "./modules/runner_vpc"

  cidr_block = var.vpc_cidr_block
}

module "iam_profile" {
  source = "./modules/runner_iam_profile"

  instance_profile_name = var.iam_instance_profile_name
  role_name             = var.iam_role_name
  role_path             = var.iam_role_path
}

module "security_group" {
  source = "./modules/runner_security_group"

  description = var.security_group_description
  name        = var.security_group_name
  vpc_id      = module.vpc.vpc_id
}

module "subnet" {
  source = "./modules/runner_subnet"

  availability_zone = var.subnet_availability_zone
  cidr_block        = var.subnet_cidr_block
  vpc_id            = module.vpc.vpc_id
}

module "launch_template" {
  source = "./modules/runner_launch_template"

  ami_id                     = var.ami_id
  iam_instance_profile_name  = module.iam_profile.instance_profile_name
  instance_type              = var.instance_type
  key_name                   = var.key_name
  security_group_ids         = [module.security_group.security_group_id]
  user_data                  = var.user_data
  instance_name_tag          = var.instance_name_tag
}

module "asg" {
  source = "./modules/runner_autoscaling_group"

  desired_capacity   = var.asg_desired_capacity
  launch_template_id = module.launch_template.launch_template_id
  max_size           = var.asg_max_size
  min_size           = var.asg_min_size
  name               = var.asg_name
  subnet_ids         = [module.subnet.subnet_id]
}