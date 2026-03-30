output "resource_group_names" {
  description = "Names of created resource groups"
  value       = module.resource_groups.resource_group_names
}

output "virtual_network_id" {
  description = "ID of the virtual network"
  value       = module.virtual_network.virtual_network_id
}

output "subnet_ids" {
  description = "IDs of created subnets"
  value       = module.virtual_network.subnet_ids
}