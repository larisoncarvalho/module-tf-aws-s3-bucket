output "resource_group_ids" {
  description = "Map of resource group IDs"
  value       = { for k, v in module.resource_groups : k => v.id }
}

output "virtual_network_id" {
  description = "Virtual network ID"
  value       = module.virtual_network_azurenetworknet.id
}