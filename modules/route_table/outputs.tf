output "route_table_id" {
  description = "Route table ID"
  value       = aws_route_table.this.id
}

output "route_table_arn" {
  description = "Route table ARN"
  value       = aws_route_table.this.arn
}