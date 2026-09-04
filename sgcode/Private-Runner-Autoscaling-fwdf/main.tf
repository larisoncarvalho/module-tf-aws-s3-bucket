module "lambda_functions" {
  source   = "git::https://github.com/terraform-aws-modules/terraform-aws-lambda.git"
  for_each = var.lambda_functions

  function_name = each.value.function_name
  architectures = each.value.architectures
  memory_size   = each.value.memory_size
  timeout       = each.value.timeout
  package_type  = each.value.package_type
  image_uri     = each.value.image_uri
  lambda_role   = each.value.lambda_role
  tracing_mode  = each.value.tracing_mode

  environment_variables = merge(
    each.value.environment_variables,
    lookup(var.lambda_sg_api_keys, each.key, null) != null ? { SG_API_KEY = var.lambda_sg_api_keys[each.key] } : {}
  )

  create_role    = false
  create_package = false

  cloudwatch_logs_retention_in_days = each.value.cloudwatch_logs_retention_in_days
  ignore_source_code_hash           = each.value.ignore_source_code_hash
}
