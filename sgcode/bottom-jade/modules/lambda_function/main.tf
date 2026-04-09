resource "aws_lambda_function" "this" {
  architectures                  = var.architectures
  function_name                  = var.function_name
  handler                        = var.handler
  memory_size                    = var.memory_size
  package_type                   = var.package_type
  reserved_concurrent_executions = var.reserved_concurrent_executions
  role                           = var.role_arn
  runtime                        = var.runtime
  timeout                        = var.timeout

  ephemeral_storage {
    size = var.ephemeral_storage_size
  }

  tracing_config {
    mode = var.tracing_mode
  }
}