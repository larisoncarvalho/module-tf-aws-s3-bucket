module "neha_private_runner_autoscale_lambda_role" {
  source = "./modules/iam_role"

  name = "Neha_Private_Runner-autoscale-lambda-role"
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
  max_session_duration = 3600
  path                 = "/"
  attached_policy_arns = ["arn:aws:iam::790543352839:policy/Neha_Private_Runner-autoscale-lambda-policy"]
}