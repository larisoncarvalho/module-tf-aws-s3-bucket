variable "vpc_id" {
  type        = string
  description = "VPC ID for route tables"
}

variable "route_tables" {
  type = map(object({
    tags = map(string)
  }))
  description = "Map of route tables to create"
  default     = {}
}

variable "routes" {
  type = map(object({
    route_table_key            = string
    destination_cidr_block     = string
    gateway_id                 = string
    destination_prefix_list_id = string
  }))
  description = "Map of routes to create"
  default     = {}
}

variable "route_table_associations" {
  type = map(object({
    route_table_key = string
    subnet_id       = string
  }))
  description = "Map of route table associations"
  default     = {}
}