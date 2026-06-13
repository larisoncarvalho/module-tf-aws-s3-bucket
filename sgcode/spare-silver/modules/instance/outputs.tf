output "instance_id" {
  description = "EC2 instance identifier"
  value       = aws_instance.this.id
}

output "volume_id" {
  description = "EBS volume identifier"
  value       = aws_ebs_volume.this.id
}

output "public_ip" {
  description = "Public IP address"
  value       = aws_instance.this.public_ip
}

output "private_ip" {
  description = "Private IP address"
  value       = aws_instance.this.private_ip
}