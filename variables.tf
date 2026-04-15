variable "region" {
  description = "AWS region"
  type        = string
}

variable "policies" {
  description = "IAM policies to create"
  type = map(object({
    name   = string
    path   = string
    policy = optional(any, {})
  }))
}