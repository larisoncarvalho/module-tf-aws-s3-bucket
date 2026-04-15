region = "global"

roles = {
  neha_private_runner_autoscale_lambda_role = {
    name = "Neha_Private_Runner-autoscale-lambda-role"
    path = "/"
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
    attached_policy_arns = [
      "arn:aws:iam::790543352839:policy/Neha_Private_Runner-autoscale-lambda-policy"
    ]
  }

  neha_private_runner_ec2_private_runner_role = {
    name = "Neha_Private_Runner-ec2-private-runner-role"
    path = "/"
    assume_role_policy_document = {
      Version = "2012-10-17"
      Statement = [
        {
          Effect = "Allow"
          Principal = {
            Service = "ec2.amazonaws.com"
          }
          Action = "sts:AssumeRole"
        }
      ]
    }
    max_session_duration = 3600
    attached_policy_arns = [
      "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
      "arn:aws:iam::790543352839:policy/Neha_Private_Runner-ec2-runner-assume-s3-role-policy"
    ]
  }
}