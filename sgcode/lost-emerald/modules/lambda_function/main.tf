resource "aws_lambda_function" "this" {
  architectures    = var.architectures
  function_name    = var.function_name
  handler          = var.handler
  memory_size      = var.memory_size
  package_type     = var.package_type
  role             = var.role_arn
  runtime          = var.runtime
  timeout          = var.timeout
  filename         = var.filename
  source_code_hash = var.source_code_hash
}