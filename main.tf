module "vpc_sg_nonprod_1" {
  source = "./modules/vpc"

  assign_generated_ipv6_cidr_block = true
  cidr_block                       = var.vpc_sg_nonprod_1.cidr_block
  instance_tenancy                 = var.vpc_sg_nonprod_1.instance_tenancy
  tags                             = var.vpc_sg_nonprod_1.tags
}

module "subnet_app_a" {
  source = "./modules/subnet"

  assign_ipv6_address_on_creation = var.subnet_app_a.assign_ipv6_address_on_creation
  availability_zone               = var.subnet_app_a.availability_zone
  cidr_block                      = var.subnet_app_a.cidr_block
  ipv6_cidr_block                 = var.subnet_app_a.ipv6_cidr_block
  map_public_ip_on_launch         = var.subnet_app_a.map_public_ip_on_launch
  tags                            = var.subnet_app_a.tags
  vpc_id                          = module.vpc_sg_nonprod_1.vpc_id
}

module "security_group_default" {
  source = "./modules/security_group"

  description = var.security_group_default.description
  name        = var.security_group_default.name
  rules       = var.security_group_default.rules
  tags        = var.security_group_default.tags
  vpc_id      = module.vpc_sg_nonprod_1.vpc_id
}

module "key_pair_nonprod_euc1" {
  source = "./modules/key_pair"

  key_name = var.key_pair_nonprod_euc1.key_name
}

module "iam_role_amazonec2containerserviceforec2role" {
  source = "./modules/iam_role"

  assume_role_policy = var.iam_role_amazonec2containerserviceforec2role.assume_role_policy
  name               = var.iam_role_amazonec2containerserviceforec2role.name
  path               = var.iam_role_amazonec2containerserviceforec2role.path
}

module "iam_instance_profile_amazonec2containerserviceforec2role" {
  source = "./modules/iam_instance_profile"

  name      = var.iam_instance_profile_amazonec2containerserviceforec2role.name
  path      = var.iam_instance_profile_amazonec2containerserviceforec2role.path
  role_name = module.iam_role_amazonec2containerserviceforec2role.role_name
}

module "ebs_volume_vol_0829d737221ed9b5a" {
  source = "./modules/ebs_volume"

  availability_zone    = var.ebs_volume_vol_0829d737221ed9b5a.availability_zone
  encrypted            = var.ebs_volume_vol_0829d737221ed9b5a.encrypted
  iops                 = var.ebs_volume_vol_0829d737221ed9b5a.iops
  multi_attach_enabled = var.ebs_volume_vol_0829d737221ed9b5a.multi_attach_enabled
  size                 = var.ebs_volume_vol_0829d737221ed9b5a.size
  snapshot_id          = var.ebs_volume_vol_0829d737221ed9b5a.snapshot_id
  tags                 = var.ebs_volume_vol_0829d737221ed9b5a.tags
  volume_type          = var.ebs_volume_vol_0829d737221ed9b5a.volume_type
}

module "network_interface_eni_03f18c266f4ca136e" {
  source = "./modules/network_interface"

  private_ips       = var.network_interface_eni_03f18c266f4ca136e.private_ips
  security_groups   = [module.security_group_default.security_group_id]
  source_dest_check = var.network_interface_eni_03f18c266f4ca136e.source_dest_check
  subnet_id         = module.subnet_app_a.subnet_id
  tags              = var.network_interface_eni_03f18c266f4ca136e.tags
}

module "instance_ecs_instances_admin_workflow_qa" {
  source = "./modules/instance"

  ami                                  = var.instance_ecs_instances_admin_workflow_qa.ami
  availability_zone                    = var.instance_ecs_instances_admin_workflow_qa.availability_zone
  ebs_optimized                        = var.instance_ecs_instances_admin_workflow_qa.ebs_optimized
  iam_instance_profile                 = module.iam_instance_profile_amazonec2containerserviceforec2role.instance_profile_name
  instance_type                        = var.instance_ecs_instances_admin_workflow_qa.instance_type
  key_name                             = module.key_pair_nonprod_euc1.key_name
  metadata_http_endpoint               = var.instance_ecs_instances_admin_workflow_qa.metadata_http_endpoint
  metadata_http_put_response_hop_limit = var.instance_ecs_instances_admin_workflow_qa.metadata_http_put_response_hop_limit
  metadata_http_tokens                 = var.instance_ecs_instances_admin_workflow_qa.metadata_http_tokens
  metadata_instance_metadata_tags      = var.instance_ecs_instances_admin_workflow_qa.metadata_instance_metadata_tags
  monitoring                           = var.instance_ecs_instances_admin_workflow_qa.monitoring
  network_interface_id                 = module.network_interface_eni_03f18c266f4ca136e.network_interface_id
  root_delete_on_termination           = var.instance_ecs_instances_admin_workflow_qa.root_delete_on_termination
  root_volume_size                     = var.instance_ecs_instances_admin_workflow_qa.root_volume_size
  root_volume_type                     = var.instance_ecs_instances_admin_workflow_qa.root_volume_type
  source_dest_check                    = var.instance_ecs_instances_admin_workflow_qa.source_dest_check
  tags                                 = var.instance_ecs_instances_admin_workflow_qa.tags
  tenancy                              = var.instance_ecs_instances_admin_workflow_qa.tenancy
}