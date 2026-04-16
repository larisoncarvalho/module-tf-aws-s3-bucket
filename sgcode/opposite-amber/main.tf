module "ecs_cluster" {
  source = "./modules/ecs_cluster"
  

  name               = var.ecs_cluster_name
  container_insights = var.ecs_cluster_container_insights
  tags               = var.ecs_cluster_tags
}