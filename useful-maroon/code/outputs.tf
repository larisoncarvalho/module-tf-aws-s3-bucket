output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.instance.instance_id
}

output "private_ip_address" {
  description = "Private IP address of the EC2 instance"
  value       = module.instance.private_ip
}

output "private_dns_name" {
  description = "Private DNS name of the EC2 instance"
  value       = module.instance.private_dns
}