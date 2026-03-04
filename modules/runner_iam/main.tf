resource "aws_iam_role" "runner" {
  name = var.role_name
  path = var.role_path

  assume_role_policy = jsonencode({
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
  })
}

resource "aws_iam_instance_profile" "runner" {
  name = var.instance_profile_name
  path = var.role_path
  role = aws_iam_role.runner.name
}