output "instance_id" {
  description = "EC2 instance ID of the private runner"
  value       = module.private_runner.instance_id
}

output "private_ip" {
  description = "Private IP address of the private runner"
  value       = module.private_runner.private_ip
}