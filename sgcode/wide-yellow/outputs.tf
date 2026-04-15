output "instance_id" {
  value       = module.taher_private_runner_ubuntu.instance_id
  description = "ID of the EC2 instance"
}

output "instance_arn" {
  value       = module.taher_private_runner_ubuntu.instance_arn
  description = "ARN of the EC2 instance"
}

output "key_pair_id" {
  value       = module.taher_private_runner_ubuntu.key_pair_id
  description = "ID of the key pair"
}

output "primary_network_interface_id" {
  value       = module.taher_private_runner_ubuntu.primary_network_interface_id
  description = "ID of the primary network interface"
}