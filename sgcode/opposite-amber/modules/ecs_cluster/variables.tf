variable "name" {
  type        = string
  description = "Name of the ECS cluster"
}

variable "container_insights" {
  type        = string
  description = "Value for the containerInsights cluster setting (enhanced, enabled, or disabled)"
}

variable "tags" {
  type        = map(string)
  description = "Key-value map of resource tags for the ECS cluster"
}