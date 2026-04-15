variable "region" {
  type        = string
  description = "AWS region"
}

variable "inline_policies" {
  type = map(object({
    policy_name = string
    policy_document = object({
      Version = string
      Statement = list(object({
        Effect   = string
        Action   = list(string)
        Resource = any
      }))
    })
  }))
  description = "Map of inline policies to attach to the role"
}