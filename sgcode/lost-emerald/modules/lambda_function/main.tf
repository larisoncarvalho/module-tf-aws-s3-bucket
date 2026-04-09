resource "aws_lambda_function" "this" {
  architectures    = var.architectures
  filename         = var.filename
  function_name    = var.function_name
  handler          = var.handler
  memory_size      = var.memory_size
  package_type     = var.package_type
  role             = var.role_arn
  runtime          = var.runtime
  source_code_hash = var.source_code_hash
  timeout          = var.timeout
}