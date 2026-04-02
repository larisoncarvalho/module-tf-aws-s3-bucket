output "vpc_endpoint_id" {
  value       = module.s3.id
  description = "VPC endpoint ID"
}

output "vpc_endpoint_state" {
  value       = module.s3.state
  description = "VPC endpoint state"
}