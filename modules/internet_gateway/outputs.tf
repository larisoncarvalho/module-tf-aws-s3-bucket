output "id" {
  value       = aws_internet_gateway.this.id
  description = "The ID of the Internet Gateway."
}

output "arn" {
  value       = aws_internet_gateway.this.arn
  description = "The ARN of the Internet Gateway."
}
