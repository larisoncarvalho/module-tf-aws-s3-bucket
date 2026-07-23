output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "VPC ID"
}

output "subnet_ids" {
  value       = module.subnets.subnet_ids
  description = "Map of subnet IDs"
}

output "security_group_ids" {
  value       = module.security_groups.security_group_ids
  description = "Map of security group IDs"
}

output "instance_ids" {
  value       = module.instances.instance_ids
  description = "Map of instance IDs"
}