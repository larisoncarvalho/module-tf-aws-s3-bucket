output "vpc_id" {
  value       = aws_vpc.this.id
  description = "VPC ID"
}

output "vpc_cidr_block" {
  value       = aws_vpc.this.cidr_block
  description = "VPC CIDR block"
}