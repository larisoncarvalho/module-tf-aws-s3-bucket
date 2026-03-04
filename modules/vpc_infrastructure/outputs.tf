output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_1a_id" {
  description = "ID of public subnet in AZ 1a"
  value       = aws_subnet.public_1a.id
}

output "public_subnet_1b_id" {
  description = "ID of public subnet in AZ 1b"
  value       = aws_subnet.public_1b.id
}

output "private_subnet_1a_id" {
  description = "ID of private subnet in AZ 1a"
  value       = aws_subnet.private_1a.id
}

output "private_subnet_1b_id" {
  description = "ID of private subnet in AZ 1b"
  value       = aws_subnet.private_1b.id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = [aws_subnet.public_1a.id, aws_subnet.public_1b.id]
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = [aws_subnet.private_1a.id, aws_subnet.private_1b.id]
}

output "internet_gateway_id" {
  description = "ID of the internet gateway"
  value       = aws_internet_gateway.main.id
}

output "public_route_table_id" {
  description = "ID of the public route table"
  value       = aws_route_table.public.id
}

output "private_route_table_1a_id" {
  description = "ID of the private route table for AZ 1a"
  value       = aws_route_table.private_1a.id
}

output "private_route_table_1b_id" {
  description = "ID of the private route table for AZ 1b"
  value       = aws_route_table.private_1b.id
}

output "default_security_group_id" {
  description = "ID of the default security group"
  value       = aws_default_security_group.default.id
}