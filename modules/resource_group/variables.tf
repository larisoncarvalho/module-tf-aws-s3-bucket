variable "resource_groups" {
  description = "Resource groups to create with their configurations"
  type        = map(object({ location = string, tags = map(string) }))
  default     = {}
}