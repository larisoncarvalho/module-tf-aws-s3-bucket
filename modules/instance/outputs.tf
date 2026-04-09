output "instance_ids" {
  description = "Map of instance keys to instance IDs"
  value       = { for k, v in aws_instance.this : k => v.id }
}

output "instance_arns" {
  description = "Map of instance keys to instance ARNs"
  value       = { for k, v in aws_instance.this : k => v.arn }
}

output "private_ips" {
  description = "Map of instance keys to private IP addresses"
  value       = { for k, v in aws_instance.this : k => v.private_ip }
}