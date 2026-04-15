module "neha_private_runner_role" {
  source = "./modules/iam_role"

  role_name = "Neha_Private_Runner-ec2-private-runner-role"
  path      = "/"
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
  attached_policies    = var.attached_policies
}