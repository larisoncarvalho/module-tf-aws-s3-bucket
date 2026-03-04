output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "instance_profile_arn" {
  description = "ARN of the instance profile"
  value       = module.iam.instance_profile_arn
}

output "role_arn" {
  description = "ARN of the IAM role"
  value       = module.iam.role_arn
}

output "security_group_id" {
  description = "ID of the security group"
  value       = module.security_group.security_group_id
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.runner.instance_id
}

output "instance_private_ip" {
  description = "Private IP address of the instance"
  value       = module.runner.instance_private_ip
}

output "instance_public_ip" {
  description = "Public IP address of the instance"
  value       = module.runner.instance_public_ip
}