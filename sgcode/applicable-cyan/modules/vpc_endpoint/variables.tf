variable "vpc_id" {
  type        = string
  description = "VPC ID for endpoints"
}

variable "vpc_endpoints" {
  type = map(object({
    service_name        = string
    vpc_endpoint_type   = string
    subnet_ids          = list(string)
    security_group_ids  = list(string)
    route_table_ids     = list(string)
    private_dns_enabled = bool
    policy              = string
  }))
  description = "Map of VPC endpoints to create"
  default     = {}
}