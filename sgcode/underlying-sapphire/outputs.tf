output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "subnet_ids" {
  description = "Map of subnet keys to subnet IDs"
  value       = module.vpc.subnet_ids
}

output "internet_gateway_id" {
  description = "ID of the internet gateway"
  value       = module.vpc.internet_gateway_id
}