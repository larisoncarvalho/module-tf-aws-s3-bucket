variable "vpc_id" {
  type        = string
  description = "VPC ID for the endpoint"
}

variable "service_name" {
  type        = string
  description = "AWS service name for the endpoint"
}

variable "vpc_endpoint_type" {
  type        = string
  description = "Type of VPC endpoint"
}

variable "route_table_ids" {
  type        = list(string)
  description = "Route table IDs to associate with the endpoint"
}

variable "policy" {
  type        = string
  description = "IAM policy document for the endpoint"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}