output "subnet_id" {
  value       = aws_subnet.this.id
  description = "ID of the subnet"
}

output "subnet_arn" {
  value       = aws_subnet.this.arn
  description = "ARN of the subnet"
}