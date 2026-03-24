output "instance_id" {
  description = "EC2 instance ID"
  value       = module.taher_private_runner_ubuntu.instance_id
}

output "private_ip" {
  description = "Private IP address of the instance"
  value       = module.taher_private_runner_ubuntu.private_ip
}