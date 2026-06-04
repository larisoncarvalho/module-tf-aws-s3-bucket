# Root outputs – re-exported from child module outputs.

output "instance_ids" {
  description = "Map of instance Name keys to AWS instance IDs."
  value       = { for k, m in module.instance : k => m.instance_id }
}

output "ebs_volume_ids" {
  description = "Map of EBS volume keys to volume IDs."
  value       = { for k, m in module.ebs_volume : k => m.volume_id }
}

output "key_pair_ids" {
  description = "Map of key pair keys to key pair IDs."
  value       = { for k, m in module.key_pair : k => m.key_pair_id }
}

output "network_interface_ids" {
  description = "Map of network interface keys to ENI IDs."
  value       = { for k, m in module.network_interface : k => m.network_interface_id }
}
