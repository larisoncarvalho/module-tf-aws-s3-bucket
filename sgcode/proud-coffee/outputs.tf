output "certificate_arn" {
  value       = module.acm_certificate.certificate_arn
  description = "ARN of the ACM certificate"
}

output "workgroup_id" {
  value       = module.athena_workgroup.workgroup_id
  description = "ID of the Athena workgroup"
}

output "backup_vault_arn" {
  value       = module.backup_vault.vault_arn
  description = "ARN of the backup vault"
}

output "asg_id" {
  value       = module.autoscaling_group.asg_id
  description = "ID of the autoscaling group"
}

output "instance_id" {
  value       = module.instance_i_0439c48efdf4ad956.instance_id
  description = "ID of the EC2 instance"
}

output "network_interface_id" {
  value       = module.network_interface_eni_02b2519b0f908256d.network_interface_id
  description = "ID of the network interface"
}

output "security_group_id" {
  value       = module.security_group_ec2_sg_v815bfuv.security_group_id
  description = "ID of the security group"
}

output "subnet_id" {
  value       = module.subnet_vpc_name_public_eu_central_1a.subnet_id
  description = "ID of the subnet"
}

output "vpc_id" {
  value       = module.vpc_vpc_name.vpc_id
  description = "ID of the VPC"
}

output "ebs_csi_policy_arn" {
  value       = module.iam_policy_ebs_csi.policy_arn
  description = "ARN of the EBS CSI IAM policy"
}