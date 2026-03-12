output "key_vault_administrator_id" {
  description = "The ID of the Key Vault Administrator role definition"
  value       = module.key_vault_administrator.role_definition_id
}

output "key_vault_administrator_name" {
  description = "The name of the Key Vault Administrator role definition"
  value       = module.key_vault_administrator.role_definition_name
}