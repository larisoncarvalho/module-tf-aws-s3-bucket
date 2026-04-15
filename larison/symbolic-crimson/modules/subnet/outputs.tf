output "subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.this.id
}

output "availability_zone" {
  description = "The availability zone of the subnet"
  value       = aws_subnet.this.availability_zone
}