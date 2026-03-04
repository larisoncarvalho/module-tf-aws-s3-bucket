module "vpc" {
  source             = "./modules/vpc_networking"
  vpc_cidr           = var.vpc_cidr
  vpc_name           = var.vpc_name
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
}

module "security_group" {
  source              = "./modules/runner_security_group"
  vpc_id              = module.vpc.vpc_id
  security_group_name = var.security_group_name
  ssh_cidr_blocks     = var.ssh_cidr_blocks
}

module "iam" {
  source                = "./modules/runner_iam"
  role_name             = var.iam_role_name
  instance_profile_name = var.instance_profile_name
}

module "key_pair" {
  source     = "./modules/runner_key_pair"
  key_name   = var.key_pair_name
  public_key = var.public_key_material
}

module "instance" {
  source                = "./modules/runner_instance"
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  key_name              = module.key_pair.key_name
  subnet_id             = module.vpc.public_subnet_id
  security_group_id     = module.security_group.security_group_id
  instance_profile_name = module.iam.instance_profile_name
  availability_zone     = var.availability_zone
  private_ip            = var.instance_private_ip
}

module "volumes" {
  source            = "./modules/runner_volumes"
  availability_zone = var.availability_zone
  instance_id       = module.instance.instance_id
  root_volume_size  = var.root_volume_size
  data_volume_size  = var.data_volume_size
}