output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "VPC ID"
}

output "subnet_id" {
  value       = module.subnet.subnet_id
  description = "Subnet ID"
}

output "security_group_id" {
  value       = module.security_group.security_group_id
  description = "Security group ID"
}

output "instance_id" {
  value       = module.instance.instance_id
  description = "EC2 instance ID"
}

output "instance_private_ip" {
  value       = module.instance.private_ip
  description = "EC2 instance private IP address"
}