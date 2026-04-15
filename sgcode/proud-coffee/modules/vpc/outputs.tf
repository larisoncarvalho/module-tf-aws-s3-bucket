output "vpc_id" {
  value       = aws_vpc.this.id
  description = "ID of the VPC"
}

output "vpc_arn" {
  value       = aws_vpc.this.arn
  description = "ARN of the VPC"
}