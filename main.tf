module "ec2_taher_private_runner_ubuntu" {
  source = "./modules/ec2_instance"

  ami                     = var.ec2_taher_private_runner_ubuntu.ami
  instance_type           = var.ec2_taher_private_runner_ubuntu.instance_type
  availability_zone       = var.ec2_taher_private_runner_ubuntu.availability_zone
  key_name                = var.ec2_taher_private_runner_ubuntu.key_name
  subnet_id               = var.ec2_taher_private_runner_ubuntu.subnet_id
  vpc_security_group_ids  = var.ec2_taher_private_runner_ubuntu.vpc_security_group_ids
  ebs_optimized           = var.ec2_taher_private_runner_ubuntu.ebs_optimized
  monitoring              = var.ec2_taher_private_runner_ubuntu.monitoring
  source_dest_check       = var.ec2_taher_private_runner_ubuntu.source_dest_check
  tenancy                 = var.ec2_taher_private_runner_ubuntu.tenancy
  metadata_options        = var.ec2_taher_private_runner_ubuntu.metadata_options
  enclave_options_enabled = var.ec2_taher_private_runner_ubuntu.enclave_options_enabled
  cpu_core_count          = var.ec2_taher_private_runner_ubuntu.cpu_core_count
  cpu_threads_per_core    = var.ec2_taher_private_runner_ubuntu.cpu_threads_per_core
}