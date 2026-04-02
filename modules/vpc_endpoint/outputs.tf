output "id" {
  value       = aws_vpc_endpoint.this.id
  description = "VPC endpoint ID"
}

output "state" {
  value       = aws_vpc_endpoint.this.state
  description = "VPC endpoint state"
}