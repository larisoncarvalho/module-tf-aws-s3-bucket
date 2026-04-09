output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.this.id
}

output "private_ip" {
  description = "Private IP address"
  value       = aws_instance.this.private_ip
}

output "availability_zone" {
  description = "Availability zone"
  value       = aws_instance.this.availability_zone
}