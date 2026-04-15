output "certificate_arns" {
  description = "ARNs of the ACM certificates"
  value       = module.acm_certificates.certificate_arns
}

output "api_gateway_id" {
  description = "ID of the API Gateway REST API"
  value       = module.platform_api_dev.api_id
}