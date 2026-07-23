output "instance_id" {
  value       = module.taher_private_runner_ubuntu.instance_id
  description = "ID of the EC2 instance"
}

output "private_ip" {
  value       = module.taher_private_runner_ubuntu.private_ip
  description = "Private IP address of the instance"
}

output "private_dns" {
  value       = module.taher_private_runner_ubuntu.private_dns
  description = "Private DNS name of the instance"
}