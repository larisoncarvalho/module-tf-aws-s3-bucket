output "route_table_id" {
  description = "ID of the route table"
  value       = module.route_table_vpc_name_private_eu_central_1a.route_table_id
}

output "route_table_arn" {
  description = "ARN of the route table"
  value       = module.route_table_vpc_name_private_eu_central_1a.route_table_arn
}