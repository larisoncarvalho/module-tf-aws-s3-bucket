output "id" {
  value       = aws_network_interface.this.id
  description = "Network interface ID"
}

output "arn" {
  value       = aws_network_interface.this.arn
  description = "Network interface ARN"
}
