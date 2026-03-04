module "vpc" {
  source = "./modules/runner_vpc"

  cidr_block = var.vpc_cidr_block
  vpc_name   = var.vpc_name
}

module "iam" {
  source = "./modules/runner_iam"

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

module "runner" {
  source = "./modules/runner_instance"

  ami_id               = var.ami_id
  iam_instance_profile = module.iam.instance_profile_name
  instance_name        = var.instance_name
  instance_type        = var.instance_type
  key_name             = var.key_name
  security_group_ids   = [module.security_group.security_group_id]
  subnet_id            = var.subnet_id
}