variable "region" {
  type        = string
  description = "AWS region where resources will be managed"
}

variable "ecs_cluster_name" {
  type        = string
  description = "Name of the ECS cluster"
}

variable "ecs_cluster_container_insights" {
  type        = string
  description = "Value for the containerInsights cluster setting (enhanced, enabled, or disabled)"
}

variable "ecs_cluster_tags" {
  type        = map(string)
  description = "Key-value map of resource tags for the ECS cluster"
}