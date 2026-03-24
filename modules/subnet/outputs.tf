output "subnet_ids" {
  description = "Map of subnet keys to subnet IDs"
  value       = { for k, v in aws_subnet.this : k => v.id }
}

output "subnet_arns" {
  description = "Map of subnet keys to subnet ARNs"
  value       = { for k, v in aws_subnet.this : k => v.arn }
}