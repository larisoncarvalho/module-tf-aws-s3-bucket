output "instance_id" {
  value       = module.instance.instance_id
  description = "EC2 instance ID"
}

output "instance_private_ip" {
  value       = module.instance.instance_private_ip
  description = "EC2 instance private IP address"
}

output "key_pair_name" {
  value       = module.instance.key_pair_name
  description = "Key pair name"
}

output "network_interface_id" {
  value       = module.instance.network_interface_id
  description = "Network interface ID"
}