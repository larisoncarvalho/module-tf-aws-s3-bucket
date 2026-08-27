output "athena_workgroup_id" {
  value = module.athena_workgroup.id
}

output "cloudformation_stack_id" {
  value = module.cloudformation_stack.id
}

output "default_vpc_id" {
  value = module.default_vpc.id
}

output "internet_gateway_id" {
  value = module.internet_gateway.id
}

output "route_table_id" {
  value = module.route_table.id
}

output "default_network_acl_id" {
  value = module.default_network_acl.id
}

output "default_security_group_id" {
  value = module.default_security_group.id
}
