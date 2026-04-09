module "iam_role" {
  source = "./modules/iam_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
  max_session_duration = 3600
  role_name            = "prowler-lambda-role-26dw0p8v"
  role_path            = "/service-role/"

  policy_attachments = {
    amazon_s3_full_access = {
      policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
    }
    lambda_basic_execution = {
      policy_arn = "arn:aws:iam::790543352839:policy/service-role/AWSLambdaBasicExecutionRole-c3e0ac58-989d-4af6-9132-129b87b25eb2"
    }
  }
}

module "lambda_function" {
  source = "./modules/lambda_function"

  architectures                  = ["x86_64"]
  ephemeral_storage_size         = 512
  function_name                  = "LambdaSQSProcessorFunction"
  handler                        = "lambda_function.lambda_handler"
  memory_size                    = 128
  package_type                   = "Zip"
  reserved_concurrent_executions = 1
  role_arn                       = module.iam_role.role_arn
  runtime                        = "python3.9"
  timeout                        = 900
  tracing_mode                   = "PassThrough"
}