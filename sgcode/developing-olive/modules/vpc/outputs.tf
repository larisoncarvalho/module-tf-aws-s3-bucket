output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}

output "dhcp_options_id" {
  description = "DHCP options ID of the VPC"
  value       = aws_vpc.this.dhcp_options_id
}