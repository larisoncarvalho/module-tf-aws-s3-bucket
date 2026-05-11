output "vpc_id" {
  description = "VPC identifier"
  value       = module.vpc_vpc_name.vpc_id
}

output "subnet_id" {
  description = "Subnet identifier"
  value       = module.subnet_vpc_name_public_eu_central_1a.subnet_id
}

output "security_group_id" {
  description = "Security group identifier"
  value       = module.security_group_6y8ixgma.security_group_id
}

output "instance_id" {
  description = "EC2 instance identifier"
  value       = module.instance_6y8ixgma.instance_id
}

output "instance_public_ip" {
  description = "EC2 instance public IP"
  value       = module.instance_6y8ixgma.public_ip
}

output "instance_private_ip" {
  description = "EC2 instance private IP"
  value       = module.instance_6y8ixgma.private_ip
}