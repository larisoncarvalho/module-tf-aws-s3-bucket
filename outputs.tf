output "athena_workgroup_arn" {
  description = "ARN of the Athena workgroup"
  value       = module.athena_workgroup.arn
}

output "athena_workgroup_id" {
  description = "ID of the Athena workgroup"
  value       = module.athena_workgroup.id
}

output "cloudformation_stack_id" {
  description = "Unique identifier of the CloudFormation stack"
  value       = module.cloudformation_stack.id
}

output "cloudformation_stack_outputs" {
  description = "Map of outputs from the CloudFormation stack"
  value       = module.cloudformation_stack.outputs
}

output "internet_gateway_id" {
  description = "ID of the internet gateway"
  value       = module.internet_gateway.id
}

output "internet_gateway_arn" {
  description = "ARN of the internet gateway"
  value       = module.internet_gateway.arn
}

output "network_acl_id" {
  description = "ID of the network ACL"
  value       = module.network_acl.id
}

output "network_acl_arn" {
  description = "ARN of the network ACL"
  value       = module.network_acl.arn
}

output "route_table_id" {
  description = "ID of the route table"
  value       = module.route_table.id
}

output "route_table_arn" {
  description = "ARN of the route table"
  value       = module.route_table.arn
}