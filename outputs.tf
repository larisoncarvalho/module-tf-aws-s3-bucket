output "instance_ids" {
  description = "Map of instance keys to instance IDs"
  value       = module.instance.instance_ids
}

output "instance_arns" {
  description = "Map of instance keys to instance ARNs"
  value       = module.instance.instance_arns
}

output "private_ips" {
  description = "Map of instance keys to private IP addresses"
  value       = module.instance.private_ips
}