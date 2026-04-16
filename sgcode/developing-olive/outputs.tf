output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "dhcp_options_id" {
  description = "DHCP options ID of the VPC"
  value       = module.vpc.dhcp_options_id
}