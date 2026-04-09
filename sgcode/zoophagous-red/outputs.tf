output "instance_id" {
  description = "EC2 instance ID"
  value       = module.instance.instance_id
}

output "private_ip" {
  description = "Private IP address of the instance"
  value       = module.instance.private_ip
}

output "key_pair_name" {
  description = "Key pair name"
  value       = module.instance.key_pair_name
}

output "network_interface_id" {
  description = "Primary network interface ID"
  value       = module.instance.network_interface_id
}