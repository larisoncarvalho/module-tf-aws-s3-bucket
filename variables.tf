variable "region" {
  type        = string
  description = "AWS region"
}

variable "attached_policies" {
  type = map(object({
    policy_arn = string
  }))
  description = "Map of policy attachments for the role"
}