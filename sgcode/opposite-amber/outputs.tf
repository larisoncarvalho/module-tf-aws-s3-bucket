output "cluster_arn" {
  description = "ARN that identifies the ECS cluster"
  value       = module.ecs_cluster.cluster_arn
}

output "cluster_name" {
  description = "Name of the ECS cluster"
  value       = module.ecs_cluster.cluster_name
}