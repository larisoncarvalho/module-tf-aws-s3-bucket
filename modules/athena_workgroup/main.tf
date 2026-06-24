resource "aws_athena_workgroup" "this" {
  name        = var.name
  description = var.description
  state       = var.state
  tags        = var.tags

  configuration {
    enforce_workgroup_configuration    = var.enforce_workgroup_configuration
    publish_cloudwatch_metrics_enabled = var.publish_cloudwatch_metrics_enabled
    requester_pays_enabled             = var.requester_pays_enabled

    bytes_scanned_cutoff_per_query = var.bytes_scanned_cutoff_per_query

    engine_version {
      selected_engine_version = var.selected_engine_version
    }

    dynamic "result_configuration" {
      for_each = var.output_location != null || var.encryption_option != null ? [1] : []
      content {
        output_location = var.output_location

        dynamic "encryption_configuration" {
          for_each = var.encryption_option != null ? [1] : []
          content {
            encryption_option = var.encryption_option
            kms_key_arn       = var.kms_key
          }
        }
      }
    }
  }
}
