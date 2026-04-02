variable "region" {
  type        = string
  description = "AWS region"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the endpoint"
}

variable "route_table_ids" {
  type        = list(string)
  description = "Route table IDs to associate with the endpoint"
}