output "certificate_arns" {
  description = "ARNs of the ACM certificates"
  value       = module.acm_certificates.certificate_arns
}

output "api_gateway_api_ids" {
  description = "IDs of the API Gateway REST APIs"
  value       = module.api_gateway_rest_apis.api_ids
}

output "appsync_api_id" {
  description = "ID of the AppSync GraphQL API"
  value       = module.appsync_api.api_id
}

output "athena_workgroup_arns" {
  description = "ARNs of the Athena workgroups"
  value       = module.athena_workgroups.workgroup_arns
}