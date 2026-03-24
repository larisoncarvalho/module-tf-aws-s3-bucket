output "subnet_id" {
  value       = aws_subnet.this.id
  description = "ID of the subnet"
}

output "subnet_arn" {
  value       = aws_subnet.this.arn
  description = "ARN of the subnet"
}

output "availability_zone_id" {
  value       = aws_subnet.this.availability_zone_id
  description = "Availability zone ID of the subnet"
}