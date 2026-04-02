variable "region" {
  type        = string
  description = "AWS region"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "route_table_ids" {
  type        = list(string)
  description = "Route table IDs"
}