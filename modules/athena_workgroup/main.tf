resource "aws_athena_workgroup" "this" {
  name        = var.name
  description = var.description
  state       = "ENABLED"

  configuration {
    enforce_workgroup_configuration    = var.enforce_workgroup_configuration
    publish_cloudwatch_metrics_enabled = var.publish_cloudwatch_metrics_enabled
    requester_pays_enabled             = var.requester_pays_enabled
  }

  tags = var.tags
}
