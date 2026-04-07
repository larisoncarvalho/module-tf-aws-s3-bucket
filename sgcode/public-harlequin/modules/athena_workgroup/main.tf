resource "aws_athena_workgroup" "this" {
  name          = var.workgroup_name
  description   = var.description
  force_destroy = false
  state         = var.state
  tags          = var.tags

  configuration {
    bytes_scanned_cutoff_per_query     = var.bytes_scanned_cutoff_per_query
    enforce_workgroup_configuration    = var.enforce_workgroup_configuration
    publish_cloudwatch_metrics_enabled = var.publish_cloudwatch_metrics_enabled
    requester_pays_enabled             = var.requester_pays_enabled

    result_configuration {
      output_location = var.output_location

      encryption_configuration {
        encryption_option = var.encryption_option
      }
    }

    engine_version {
      selected_engine_version = var.selected_engine_version
    }
  }
}