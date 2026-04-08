output "vault_name" {
  description = "Name of the backup vault"
  value       = aws_backup_vault.this.name
}

output "vault_arn" {
  description = "ARN of the backup vault"
  value       = aws_backup_vault.this.arn
}