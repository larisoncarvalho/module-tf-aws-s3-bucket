region = "ap-southeast-1"

athena_workgroup_name                               = "primary"
athena_workgroup_state                              = "ENABLED"
athena_workgroup_enforce_workgroup_configuration    = false
athena_workgroup_publish_cloudwatch_metrics_enabled = true
athena_workgroup_requester_pays_enabled             = false
athena_workgroup_selected_engine_version            = "AUTO"

iam_role_name                = "AmazonSageMakerServiceCatalogProductsApiGatewayRole"
iam_role_path                = "/service-role/"
iam_role_description         = "SageMaker role created from the SageMaker AWS Management Console. This role will grant permissions required to use AWS ApiGateway within the Amazon SageMaker portfolio of products."
iam_role_assume_role_policy  = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"apigateway.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
iam_role_max_session_duration = 3600