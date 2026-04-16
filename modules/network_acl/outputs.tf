output "id" {
  description = "The ID of the Network ACL"
  value       = aws_default_network_acl.this.id
}

output "arn" {
  description = "The ARN of the Network ACL"
  value       = aws_default_network_acl.this.arn
}