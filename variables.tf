variable "internet_gateways" {
  type = map(object({
    vpc_id = string
    tags   = optional(map(string), {})
  }))
  default = {}
}
