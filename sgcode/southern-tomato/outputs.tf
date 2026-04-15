output "instance_id" {
  value       = module.instance.instance_id
  description = "Instance ID"
}

output "instance_private_ip" {
  value       = module.instance.private_ip
  description = "Instance private IP"
}

output "key_pair_name" {
  value       = module.key_pair.key_name
  description = "Key pair name"
}