region = "us-east-1"

policies = {
  neha_private_runner_runner_s3_policy = {
    name = "Neha_Private_Runner-runner-s3-policy"
    path = "/"
    policy = {
      Statement = [
        {
          Action = [
            "s3:DeleteObjectTagging",
            "s3:PutObject",
            "s3:GetObject",
            "s3:DeleteObjectVersion",
            "s3:GetObjectVersionTagging",
            "s3:PutObjectVersionTagging",
            "s3:GetObjectTagging",
            "s3:ListBucket",
            "s3:PutObjectTagging",
            "s3:DeleteObjectVersionTagging",
            "s3:DeleteObject",
          ]
          Effect = "Allow"
          Resource = [
            "arn:aws:s3:::7ungwu6v-private-runner-storage-backend",
            "arn:aws:s3:::7ungwu6v-private-runner-storage-backend/*",
          ]
          Sid = "VisualEditor0"
        },
      ]
      Version = "2012-10-17"
    }
  }
  neha_private_runner_ec2_runner_assume_s3_role_policy = {
    name = "Neha_Private_Runner-ec2-runner-assume-s3-role-policy"
    path = "/"
    policy = {
      Statement = [
        {
          Action = [
            "sts:AssumeRole",
          ]
          Effect = "Allow"
          Resource = [
            "arn:aws:iam::790543352839:role/Neha_Private_Runner-private-runner-s3-role",
          ]
        },
      ]
      Version = "2012-10-17"
    }
  }
}