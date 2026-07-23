output "role_definition_id" {
  value       = module.key_vault_administrator.role_definition_id
  description = "The unique identifier for the Key Vault Administrator role definition"
}

output "role_name" {
  value       = module.key_vault_administrator.name
  description = "The name of the Key Vault Administrator role definition"
}