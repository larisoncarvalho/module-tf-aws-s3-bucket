module "iam_role" {
  source = "./modules/iam_role"

  assume_role_policy_document = {
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  }
  attached_policies = {
    basic_execution = {
      policy_arn = var.lambda_basic_execution_policy_arn
    }
  }
  max_session_duration = 3600
  role_name            = "adhoc-lambda-role-xwmwh7f3"
  role_path            = "/service-role/"
}

module "lambda_function" {
  source = "./modules/lambda_function"

  architectures    = ["x86_64"]
  filename         = var.lambda_package_path
  function_name    = "adhoc-lambda"
  handler          = "lambda_function.lambda_handler"
  memory_size      = 128
  package_type     = "Zip"
  role_arn         = module.iam_role.role_arn
  runtime          = "python3.7"
  source_code_hash = var.lambda_source_code_hash
  timeout          = 900
}