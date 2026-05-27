output "project_iam_policy_etag" {
  description = "The etag of the project IAM policy"
  value       = module.project_iam_policy.etag
}

output "project_iam_audit_config_service" {
  description = "The service the audit config applies to"
  value       = module.project_iam_audit_config.service
}

output "project_organization_policy_etag" {
  description = "The etag of the organization policy"
  value       = module.project_organization_policy.etag
}

output "service_account_key_ids" {
  description = "Map of key IDs for each managed service account key"
  value       = { for k, v in module.service_account_key : k => v.key_ids[k] }
}