output "security_group_id" {
  description = "Security group identifier"
  value       = aws_security_group.this.id
}