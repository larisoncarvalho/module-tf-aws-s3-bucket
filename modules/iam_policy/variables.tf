variable "policies" {
  description = "IAM policies to create"
  type        = map(object({ name = string, path = string, policy = any }))
  default     = {}
}