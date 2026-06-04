output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.instance.instance_id
}

output "private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = module.instance.private_ip
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = module.instance.public_ip
}