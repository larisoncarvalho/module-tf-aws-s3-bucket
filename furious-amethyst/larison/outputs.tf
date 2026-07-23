output "instance_id" {
  value       = module.taher_private_runner_ubuntu.instance_id
  description = "EC2 instance ID"
}

output "private_ip" {
  value       = module.taher_private_runner_ubuntu.private_ip
  description = "Private IP address of the instance"
}