output "user_data_subnet_id" {
  value       = module.user_data.subnet_id
  description = "The ID of the user_data subnet"
}

output "user_data_subnet_arn" {
  value       = module.user_data.subnet_arn
  description = "The ARN of the user_data subnet"
}