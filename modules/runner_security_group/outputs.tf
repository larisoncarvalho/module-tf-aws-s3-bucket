output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.runner.id
}

output "security_group_name" {
  description = "Name of the security group"
  value       = aws_security_group.runner.name
}