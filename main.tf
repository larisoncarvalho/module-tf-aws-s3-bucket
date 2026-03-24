module "lambda_edge_role" {
  source = "./modules/iam_role"

  role_name            = "0eu096k-9ci2y0p"
  path                 = "/"
  max_session_duration = 3600
  assume_role_policy_document = {
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = [
            "edgelambda.amazonaws.com",
            "lambda.amazonaws.com"
          ]
        }
        Action = "sts:AssumeRole"
      }
    ]
  }
  inline_policies = var.inline_policies
}