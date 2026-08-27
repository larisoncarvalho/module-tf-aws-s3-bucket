variable "vpc_id" {
  type = string
}

variable "routes" {
  type = list(object({
    cidr_block                = optional(string, null)
    ipv6_cidr_block           = optional(string, null)
    gateway_id                = optional(string, null)
    nat_gateway_id            = optional(string, null)
    network_interface_id      = optional(string, null)
    transit_gateway_id        = optional(string, null)
    vpc_peering_connection_id = optional(string, null)
    egress_only_gateway_id    = optional(string, null)
  }))
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}
