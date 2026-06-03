output "instance_id" {
  value       = module.ext_approval_qa.instance_id
  description = "ID of the EC2 instance"
}

output "private_ip" {
  value       = module.ext_approval_qa.private_ip
  description = "Private IP address of the instance"
}

output "public_ip" {
  value       = module.ext_approval_qa.public_ip
  description = "Public IP address of the instance"
}