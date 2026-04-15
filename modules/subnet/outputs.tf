output "subnet_id" {
  value       = aws_subnet.this.id
  description = "The ID of the subnet"
}

output "availability_zone" {
  value       = aws_subnet.this.availability_zone
  description = "The availability zone of the subnet"
}

output "cidr_block" {
  value       = aws_subnet.this.cidr_block
  description = "The CIDR block of the subnet"
}