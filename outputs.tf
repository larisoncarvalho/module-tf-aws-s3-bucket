output "backup_operator_role_id" {
  description = "The ID of the Backup Operator role definition"
  value       = module.backup_operator.role_definition_id
}

output "backup_operator_resource_id" {
  description = "The resource ID of the Backup Operator role definition"
  value       = module.backup_operator.role_definition_resource_id
}