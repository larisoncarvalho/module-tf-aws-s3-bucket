output "key_vault_administrator_id" {
  value       = module.key_vault_administrator.id
  description = "The ID of the Key Vault Administrator role definition"
}

output "key_vault_administrator_role_definition_id" {
  value       = module.key_vault_administrator.role_definition_id
  description = "The role definition ID of the Key Vault Administrator role"
}