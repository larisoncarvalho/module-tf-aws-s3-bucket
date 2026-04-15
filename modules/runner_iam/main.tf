resource "aws_iam_role" "runner" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Name = var.role_name
  }
}

resource "aws_iam_instance_profile" "runner" {
  name = var.instance_profile_name
  role = aws_iam_role.runner.name
}