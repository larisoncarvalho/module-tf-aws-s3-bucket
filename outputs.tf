output "resource_group_id" {
  description = "Resource group ID"
  value       = module.azurenetwork.id
}

output "resource_group_name" {
  description = "Resource group name"
  value       = module.azurenetwork.name
}