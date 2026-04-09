output "internet_gateway_id" {
  description = "Internet gateway ID"
  value       = module.vpc_name.id
}

output "internet_gateway_arn" {
  description = "Internet gateway ARN"
  value       = module.vpc_name.arn
}