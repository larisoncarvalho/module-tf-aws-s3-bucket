output "internet_gateway_id" {
  description = "ID of the internet gateway"
  value       = module.vpc_name.id
}

output "internet_gateway_arn" {
  description = "ARN of the internet gateway"
  value       = module.vpc_name.arn
}