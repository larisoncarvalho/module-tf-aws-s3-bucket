resource "aws_lambda_function" "this" {
  architectures                  = var.architectures
  filename                       = var.filename
  function_name                  = var.function_name
  handler                        = var.handler
  memory_size                    = var.memory_size
  package_type                   = var.package_type
  reserved_concurrent_executions = var.reserved_concurrent_executions
  role                           = var.role_arn
  runtime                        = var.runtime
  source_code_hash               = var.source_code_hash
  timeout                        = var.timeout

  ephemeral_storage {
    size = var.ephemeral_storage_size
  }

  snap_start {
    apply_on = var.snap_start_apply_on
  }

  tracing_config {
    mode = var.tracing_mode
  }
}