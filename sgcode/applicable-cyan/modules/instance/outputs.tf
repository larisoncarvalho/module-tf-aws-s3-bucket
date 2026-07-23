output "instance_ids" {
  value       = { for k, v in aws_instance.this : k => v.id }
  description = "Map of instance IDs"
}

output "instance_private_ips" {
  value       = { for k, v in aws_instance.this : k => v.private_ip }
  description = "Map of instance private IPs"
}