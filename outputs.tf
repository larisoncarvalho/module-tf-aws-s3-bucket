output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.do_not_delete_vpc.vpc_id
}

output "subnet_ids" {
  description = "Map of subnet IDs"
  value       = { for k, v in module.subnets : k => v.subnet_id }
}

output "internet_gateway_id" {
  description = "The ID of the internet gateway"
  value       = module.do_not_delete_igw.internet_gateway_id
}

output "route_table_id" {
  description = "The ID of the private route table"
  value       = module.do_not_delete_private_route_table.route_table_id
}

output "security_group_id" {
  description = "The ID of the default security group"
  value       = module.default_security_group.security_group_id
}

output "network_acl_id" {
  description = "The ID of the default network ACL"
  value       = module.do_not_delete_default_nacl.network_acl_id
}