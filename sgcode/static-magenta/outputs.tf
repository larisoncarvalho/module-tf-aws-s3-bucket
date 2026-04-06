output "instance_id" {
  value       = module.instance.instance_id
  description = "ID of the EC2 instance"
}

output "instance_private_ip" {
  value       = module.instance.private_ip
  description = "Private IP address of the instance"
}

output "key_pair_name" {
  value       = module.key_pair.key_name
  description = "Name of the key pair"
}

output "network_interface_id" {
  value       = module.instance.network_interface_id
  description = "ID of the network interface"
}