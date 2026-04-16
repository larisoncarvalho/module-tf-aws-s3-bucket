output "id" {
  description = "ID of the network ACL"
  value       = aws_default_network_acl.this.id
}

output "arn" {
  description = "ARN of the network ACL"
  value       = aws_default_network_acl.this.arn
}