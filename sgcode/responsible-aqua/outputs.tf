output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.instance.instance_id
}

output "instance_private_ip" {
  description = "Primary private IP address of the EC2 instance"
  value       = module.instance.private_ip
}

output "network_interface_id" {
  description = "ID of the elastic network interface"
  value       = module.instance.network_interface_id
}

output "key_pair_key_name" {
  description = "Name of the EC2 key pair"
  value       = module.key_pair.key_name
}