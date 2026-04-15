output "azure_resource_group_id" {
  description = "Azure resource group ID"
  value       = module.azurenetwork.id
}

output "ec2_instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2_instance.id
}

output "ec2_public_ip" {
  description = "EC2 instance public IP address"
  value       = module.ec2_instance.public_ip
}

output "ec2_private_ip" {
  description = "EC2 instance private IP address"
  value       = module.ec2_instance.private_ip
}