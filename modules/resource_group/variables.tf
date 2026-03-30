variable "resource_groups" {
  description = "Resource groups to create"
  type        = map(object({ location = string, tags = map(string) }))
}