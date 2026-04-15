output "resource_group_names" {
  description = "Names of all resource groups"
  value       = { for k, rg in module.resource_groups : k => rg.name }
}

output "virtual_network_id" {
  description = "Virtual network ID"
  value       = module.virtual_network_azurenetworknet.id
}