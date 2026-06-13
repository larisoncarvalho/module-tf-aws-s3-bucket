region                        = "us-east-1"
iam_role_name                 = "AmazonSageMakerServiceCatalogProductsLaunchRole"
iam_role_path                 = "/service-role/"
iam_role_description          = "SageMaker role created from the SageMaker AWS Management Console. This role has the permissions required to launch the Amazon SageMaker portfolio of products from AWS ServiceCatalog."
iam_role_assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"servicecatalog.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
iam_role_max_session_duration = 3600
iam_role_attached_policy_arns = {
  amazonsagemakeradmin_servicecatalogproductsservicerolepolicy = {
    arn = "arn:aws:iam::aws:policy/AmazonSageMakerAdmin-ServiceCatalogProductsServiceRolePolicy"
  }
}