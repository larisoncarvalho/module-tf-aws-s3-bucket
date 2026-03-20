output "instance_id" {
  description = "EC2 instance ID"
  value       = module.private_runner.instance_id
}

output "private_ip_address" {
  description = "Private IP address of the instance"
  value       = module.private_runner.private_ip_address
}