output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = module.subnet.subnet_id
}

output "route_table_id" {
  description = "The ID of the route table"
  value       = module.route_table.route_table_id
}

output "network_acl_id" {
  description = "The ID of the network ACL"
  value       = module.network_acl.network_acl_id
}