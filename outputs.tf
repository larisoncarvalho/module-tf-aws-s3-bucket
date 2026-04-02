output "vpc_endpoint_id" {
  value       = module.s3_endpoint.vpc_endpoint_id
  description = "VPC endpoint ID"
}