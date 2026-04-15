output "instance_ids" {
  description = "Map of EC2 instance IDs"
  value       = { for k, v in module.ec2_instances : k => v.instance_id }
}

output "private_ips" {
  description = "Map of private IP addresses"
  value       = { for k, v in module.ec2_instances : k => v.private_ip }
}

output "public_ips" {
  description = "Map of public IP addresses"
  value       = { for k, v in module.ec2_instances : k => v.public_ip }
}