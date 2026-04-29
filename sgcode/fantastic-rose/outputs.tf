output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.instance.instance_id
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = module.instance.private_ip
}

output "network_interface_id" {
  description = "ID of the network interface"
  value       = module.network_interface.network_interface_id
}

output "key_pair_key_name" {
  description = "The key pair name"
  value       = module.key_pair.key_name
}