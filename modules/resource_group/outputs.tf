output "resource_group_ids" {
  description = "Map of resource group names to their IDs"
  value       = { for k, rg in azurerm_resource_group.this : k => rg.id }
}

output "resource_group_names" {
  description = "Map of resource group keys to their names"
  value       = { for k, rg in azurerm_resource_group.this : k => rg.name }
}