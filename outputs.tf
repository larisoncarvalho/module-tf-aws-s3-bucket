output "project_iam_policy_etag" {
  description = "The etag of the project IAM policy"
  value       = module.project_iam_policy.etag
}

output "project_iam_audit_config_service" {
  description = "The service for which audit logging is configured"
  value       = module.project_iam_audit_config.service
}

output "project_organization_policy_etag" {
  description = "The etag of the organization policy"
  value       = module.project_organization_policy.etag
}