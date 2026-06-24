variable "key_pairs" {
  description = "Map of EC2 key pairs to manage"
  type = map(object({
    key_name   = string
    public_key = optional(string, "")
    tags       = optional(map(string), {})
  }))
  default = {}
}
