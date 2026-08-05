output "instance_id" {
  value       = module.instance.instance_id
  description = "ID of the EC2 instance"
}

output "key_pair_name" {
  value       = module.key_pair.key_name
  description = "Name of the SSH key pair"
}

output "network_interface_id" {
  value       = module.network_interface.network_interface_id
  description = "ID of the network interface"
}