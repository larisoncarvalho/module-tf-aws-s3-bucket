output "sg_vpc_jkdsbfkjdsabv_default_route_table_id" {
  description = "Route table ID for sg-vpc-jkdsbfkjdsabv default route table"
  value       = module.sg_vpc_jkdsbfkjdsabv_default.route_table_id
}

output "sg_vpc_2_default_route_table_id" {
  description = "Route table ID for sg-vpc-2 default route table"
  value       = module.sg_vpc_2_default.route_table_id
}