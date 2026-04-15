variable "region" {
  description = "AWS region"
  type        = string
}

variable "route_table_vpc_name_private_eu_central_1a" {
  description = "Configuration for route table vpc_name-private-eu-central-1a"
  type = object({
    vpc_id = string
    tags   = map(string)
    routes = optional(map(object({
      destination_cidr_block     = optional(string)
      destination_prefix_list_id = optional(string)
      gateway_id                 = optional(string)
    })), {})
    associations = optional(map(object({
      subnet_id = string
    })), {})
  })
}