region                        = "us-east-1"
iam_role_name                 = "AmazonSageMakerServiceCatalogProductsApiGatewayRole"
iam_role_path                 = "/service-role/"
iam_role_description          = "SageMaker role created from the SageMaker AWS Management Console. This role will grant permissions required to use AWS ApiGateway within the Amazon SageMaker portfolio of products."
iam_role_assume_role_policy   = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "apigateway.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOT
iam_role_max_session_duration = 3600