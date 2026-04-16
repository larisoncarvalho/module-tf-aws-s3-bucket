output "id" {
  description = "ID of the route table"
  value       = aws_route_table.this.id
}

output "arn" {
  description = "ARN of the route table"
  value       = aws_route_table.this.arn
}