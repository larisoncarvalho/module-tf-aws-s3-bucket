variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "subnets" {
  description = "Map of subnet instances"
  type = map(object({
    cidr_block              = string
    vpc_id                  = string
    availability_zone       = string
    map_public_ip_on_launch = optional(bool, false)
    tags                    = optional(map(string), {})
  }))
  default = {}
}
