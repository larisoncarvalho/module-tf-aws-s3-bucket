output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.instance.instance_id
}

output "primary_network_interface_id" {
  description = "ID of the primary network interface of the instance"
  value       = module.instance.primary_network_interface_id
}

output "ebs_volume_id" {
  description = "ID of the EBS volume"
  value       = module.ebs_volume.volume_id
}

output "key_name" {
  description = "Name of the key pair"
  value       = module.key_pair.key_name
}

output "network_interface_id" {
  description = "ID of the network interface"
  value       = module.network_interface.network_interface_id
}