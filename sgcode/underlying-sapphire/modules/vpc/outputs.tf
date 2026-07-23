output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.this.id
}

output "subnet_ids" {
  description = "Map of subnet keys to subnet IDs"
  value       = { for k, v in aws_subnet.this : k => v.id }
}

output "internet_gateway_id" {
  description = "ID of the internet gateway"
  value       = aws_internet_gateway.this.id
}