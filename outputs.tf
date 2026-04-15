output "subnet_id" {
  value       = module.vpc_02_private_eu_central_1b.subnet_id
  description = "ID of the subnet"
}

output "subnet_arn" {
  value       = module.vpc_02_private_eu_central_1b.subnet_arn
  description = "ARN of the subnet"
}