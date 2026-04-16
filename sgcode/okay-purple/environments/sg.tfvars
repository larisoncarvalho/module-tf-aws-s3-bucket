region               = "us-east-1"
name                 = "AmazonSageMakerServiceCatalogProductsApiGatewayRole"
path                 = "/service-role/"
description          = "SageMaker role created from the SageMaker AWS Management Console. This role will grant permissions required to use AWS ApiGateway within the Amazon SageMaker portfolio of products."
max_session_duration = 3600
assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"apigateway.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"

attached_policy_arns = {
  amazon_sagemaker_service_catalog_products_api_gateway_service_role_policy = {
    arn = "arn:aws:iam::aws:policy/service-role/AmazonSageMakerServiceCatalogProductsApiGatewayServiceRolePolicy"
  }
}