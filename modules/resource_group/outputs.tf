output "resource_group_names" {
  description = "Map of resource group names"
  value       = { for k, rg in azurerm_resource_group.this : k => rg.name }
}

output "resource_group_ids" {
  description = "Map of resource group IDs"
  value       = { for k, rg in azurerm_resource_group.this : k => rg.id }
}