region             = "us-east-1"
iam_policy_name    = "AmazonSageMaker-ExecutionPolicy-20231125T142640"
iam_policy_path    = "/service-role/"
iam_policy_policy  = "{\"Statement\":[{\"Action\":[\"s3:GetObject\",\"s3:PutObject\",\"s3:DeleteObject\",\"s3:ListBucket\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::*\"]}],\"Version\":\"2012-10-17\"}"