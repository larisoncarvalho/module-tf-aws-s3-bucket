variable "vpc_id" {
  type        = string
  description = "VPC ID for the subnets"
}

variable "subnets" {
  type = map(object({
    availability_zone           = string
    cidr_block                  = string
    map_public_ip_on_launch     = bool
    tags                        = map(string)
  }))
  description = "Map of subnets to create"
  default     = {}
}