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
  description = "The ID of the Internet Gateway"
  value       = module.internet_gateway.id
}

output "network_acl_id" {
  description = "The ID of the Network ACL"
  value       = module.network_acl.id
}

output "route_table_id" {
  description = "The ID of the route table"
  value       = module.route_table.id
}