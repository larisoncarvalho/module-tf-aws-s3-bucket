output "certificate_arns" {
  description = "ARNs of the ACM certificates"
  value       = module.acm_certificate.certificate_arns
}

output "api_gateway_ids" {
  description = "IDs of the API Gateway REST APIs"
  value       = module.api_gateway_rest_api.api_ids
}

output "appsync_api_id" {
  description = "ID of the AppSync GraphQL API"
  value       = module.appsync_graphql_api.api_id
}

output "athena_workgroup_ids" {
  description = "IDs of the Athena workgroups"
  value       = module.athena_workgroup.workgroup_ids
}