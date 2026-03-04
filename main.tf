module "vpc" {
  source = "./modules/runner_vpc"

  cidr_block = var.vpc_cidr_block
  tags       = var.vpc_tags
}

module "iam_profile" {
  source = "./modules/runner_iam_profile"

  role_name             = var.iam_role_name
  instance_profile_name = var.iam_instance_profile_name
  role_path             = var.iam_role_path
}

module "security_group" {
  source = "./modules/runner_security_group"

  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = module.vpc.vpc_id
}

module "subnet" {
  source = "./modules/runner_subnet"

  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.subnet_availability_zone
  tags              = var.subnet_tags
}

module "launch_template" {
  source = "./modules/runner_launch_template"

  name                      = var.launch_template_name
  ami_id                    = var.ami_id
  instance_type             = var.instance_type
  key_name                  = var.key_name
  iam_instance_profile_name = module.iam_profile.instance_profile_name
  security_group_ids        = [module.security_group.security_group_id]
  instance_name_tag         = var.instance_name_tag
}

module "asg" {
  source = "./modules/runner_autoscaling_group"

  name               = var.asg_name
  subnet_ids         = [module.subnet.subnet_id]
  desired_capacity   = var.asg_desired_capacity
  min_size           = var.asg_min_size
  max_size           = var.asg_max_size
  launch_template_id = module.launch_template.launch_template_id
}