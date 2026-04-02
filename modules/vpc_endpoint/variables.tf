variable "vpc_id" {
  type        = string
  description = "VPC ID where the endpoint will be created"
}

variable "service_name" {
  type        = string
  description = "AWS service name for the VPC endpoint"
}

variable "vpc_endpoint_type" {
  type        = string
  description = "Type of VPC endpoint (Gateway or Interface)"
}

variable "route_table_ids" {
  type        = list(string)
  description = "Route table IDs to associate with the endpoint"
}

variable "policy" {
  type        = string
  description = "IAM policy document for the VPC endpoint"
}

variable "private_dns_enabled" {
  type        = bool
  description = "Whether to enable private DNS for the endpoint"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the VPC endpoint"
}