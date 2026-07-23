output "subnet_id" {
  value       = aws_subnet.this.id
  description = "The ID of the subnet"
}

output "subnet_arn" {
  value       = aws_subnet.this.arn
  description = "The ARN of the subnet"
}