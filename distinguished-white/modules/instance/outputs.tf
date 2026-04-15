output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.this.id
}

output "private_ip_address" {
  description = "Private IP address of the instance"
  value       = aws_instance.this.private_ip
}

output "availability_zone" {
  description = "Availability zone where instance is deployed"
  value       = aws_instance.this.availability_zone
}