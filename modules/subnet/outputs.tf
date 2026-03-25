output "subnet_id" {
  value       = aws_subnet.this.id
  description = "Subnet ID"
}

output "subnet_arn" {
  value       = aws_subnet.this.arn
  description = "Subnet ARN"
}