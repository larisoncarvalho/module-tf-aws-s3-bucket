output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "subnet_id" {
  description = "ID of the public subnet"
  value       = module.vpc.public_subnet_id
}

output "security_group_id" {
  description = "ID of the security group"
  value       = module.security_group.security_group_id
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.instance.instance_id
}

output "instance_public_ip" {
  description = "Public IP address of the instance"
  value       = module.instance.instance_public_ip
}

output "instance_private_ip" {
  description = "Private IP address of the instance"
  value       = module.instance.instance_private_ip
}

output "iam_role_arn" {
  description = "ARN of the IAM role"
  value       = module.iam.role_arn
}

output "instance_profile_arn" {
  description = "ARN of the instance profile"
  value       = module.iam.instance_profile_arn
}

output "root_volume_id" {
  description = "ID of the root volume"
  value       = module.volumes.root_volume_id
}

output "data_volume_id" {
  description = "ID of the data volume"
  value       = module.volumes.data_volume_id
}