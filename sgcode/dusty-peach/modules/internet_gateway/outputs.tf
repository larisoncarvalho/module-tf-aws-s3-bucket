output "id" {
  description = "Internet gateway ID"
  value       = aws_internet_gateway.this.id
}

output "arn" {
  description = "Internet gateway ARN"
  value       = aws_internet_gateway.this.arn
}