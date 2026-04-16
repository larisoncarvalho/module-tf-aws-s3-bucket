region               = "us-east-1"
name                 = "AmazonSageMakerServiceCatalogProductsCloudformationRole"
path                 = "/service-role/"
description          = "SageMaker role created from the SageMaker AWS Management Console. This role will grant permissions required to use AWS CloudFormation within the Amazon SageMaker portfolio of products."
assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"cloudformation.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
max_session_duration = 3600

attached_policy_arns = {
  amazonsagemakercatalogproductscloudformationservicerolepolicy = {
    arn = "arn:aws:iam::aws:policy/service-role/AmazonSageMakerServiceCatalogProductsCloudformationServiceRolePolicy"
  }
}