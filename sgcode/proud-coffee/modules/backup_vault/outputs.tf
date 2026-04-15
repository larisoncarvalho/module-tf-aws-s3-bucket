output "vault_arn" {
  value       = aws_backup_vault.this.arn
  description = "ARN of the backup vault"
}

output "vault_name" {
  value       = aws_backup_vault.this.name
  description = "Name of the backup vault"
}