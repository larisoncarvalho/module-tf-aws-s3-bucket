output "api_gateway_id" {
  description = "ID of the API Gateway v2 API"
  value       = module.apigatewayv2_api.api_id
}

output "api_gateway_endpoint" {
  description = "Endpoint of the API Gateway v2 API"
  value       = module.apigatewayv2_api.api_endpoint
}

output "athena_workgroup_id" {
  description = "ID of the Athena workgroup"
  value       = module.athena_workgroup.workgroup_id
}

output "autoscaling_group_arn" {
  description = "ARN of the Auto Scaling group"
  value       = module.autoscaling_group.asg_arn
}