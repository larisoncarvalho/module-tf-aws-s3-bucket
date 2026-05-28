resource "aws_config_config_rule" "this" {
  for_each = var.config_rules

  name                        = each.value.name
  description                 = each.value.description
  input_parameters            = each.value.input_parameters != "" ? each.value.input_parameters : null
  maximum_execution_frequency = each.value.maximum_execution_frequency != "" ? each.value.maximum_execution_frequency : null

  dynamic "scope" {
    for_each = each.value.scope != null ? [each.value.scope] : []
    content {
      compliance_resource_types = scope.value.compliance_resource_types
    }
  }

  source {
    owner             = each.value.source_owner
    source_identifier = each.value.source_identifier
  }

  evaluation_mode {
    mode = each.value.evaluation_mode
  }
}