output "int_qa_cert_arn" {
  value       = module.int_qa_stackguardian_cert.arn
  description = "ARN of the int.qa.stackguardian.io certificate"
}

output "stackguardian_cert_arn" {
  value       = module.stackguardian_cert.arn
  description = "ARN of the stackguardian.io certificate"
}

output "platform_api_dev_id" {
  value       = module.platform_api_dev.id
  description = "ID of the platform-api-dev REST API"
}

output "sg_api_qa_id" {
  value       = module.sg_api_qa.id
  description = "ID of the sg-api-qa REST API"
}

output "arunim_test_api_id" {
  value       = module.arunim_test_api.id
  description = "ID of the arunim-test-api REST API"
}

output "github_oidc_wrapper_id" {
  value       = module.github_oidc_wrapper.id
  description = "ID of the github-oidc-wrapper REST API"
}

output "orchestrator_platform_api_id" {
  value       = module.orchestrator_platform_api.id
  description = "ID of the orchestrator-platform-api GraphQL API"
}

output "de_manuel_meireles_workgroup_id" {
  value       = module.de_manuel_meireles_workgroup.id
  description = "ID of the de-manuel-meireles Athena workgroup"
}

output "dev_manuel_meireles_workgroup_id" {
  value       = module.dev_manuel_meireles_workgroup.id
  description = "ID of the dev-manuel-meireles Athena workgroup"
}

output "dev_pedro_chaves_workgroup_id" {
  value       = module.dev_pedro_chaves_workgroup.id
  description = "ID of the dev-pedro-chaves Athena workgroup"
}