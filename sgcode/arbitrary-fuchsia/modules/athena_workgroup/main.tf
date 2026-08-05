resource "aws_athena_workgroup" "this" {
  for_each = var.workgroups

  description   = each.value.description
  force_destroy = each.value.force_destroy
  name          = each.value.name
  state         = each.value.state

  configuration {
    bytes_scanned_cutoff_per_query     = each.value.bytes_scanned_cutoff_per_query
    enforce_workgroup_configuration    = each.value.enforce_workgroup_configuration
    publish_cloudwatch_metrics_enabled = each.value.publish_cloudwatch_metrics_enabled
    requester_pays_enabled             = each.value.requester_pays_enabled

    result_configuration {
      output_location = each.value.output_location

      encryption_configuration {
        encryption_option = each.value.encryption_option
      }
    }

    engine_version {
      selected_engine_version = each.value.selected_engine_version
    }
  }

  tags = each.value.tags
}