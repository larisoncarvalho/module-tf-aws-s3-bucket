module "ec2_private_runner" {
  source = "./modules/ec2_instance"

  ami_id                  = var.ec2_private_runner.ami_id
  instance_type           = var.ec2_private_runner.instance_type
  availability_zone       = var.ec2_private_runner.availability_zone
  key_name                = var.ec2_private_runner.key_name
  vpc_security_group_ids  = var.ec2_private_runner.vpc_security_group_ids
  subnet_id               = var.ec2_private_runner.subnet_id
  source_dest_check       = var.ec2_private_runner.source_dest_check
  ebs_optimized           = var.ec2_private_runner.ebs_optimized
  monitoring              = var.ec2_private_runner.monitoring
  tenancy                 = var.ec2_private_runner.tenancy
  metadata_options        = var.ec2_private_runner.metadata_options
  enclave_options_enabled = var.ec2_private_runner.enclave_options_enabled
  tags                    = var.ec2_private_runner.tags
}
#comment