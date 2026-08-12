athena_workgroups = {
  primary = {
    name                               = "primary"
    state                              = "ENABLED"
    enforce_workgroup_configuration    = false
    publish_cloudwatch_metrics_enabled = true
    requester_pays_enabled             = false
    selected_engine_version            = "AUTO"
  }
}

cloudformation_stacks = {
  stulyze_app = {
    name             = "stulyze-app"
    disable_rollback = false
  }
}

iam_policies = {
  all = {
    name        = "All"
    path        = "/"
    policy_file = "all.json"
  }
  amazonsagemaker_executionpolicy_20231125t142640 = {
    name        = "AmazonSageMaker-ExecutionPolicy-20231125T142640"
    path        = "/service-role/"
    policy_file = "sagemaker_execution.json"
  }
  amazonsagemakerservicecatalogproductsuserole_20231125t142608 = {
    name        = "AmazonSageMakerServiceCatalogProductsUseRole-20231125T142608"
    path        = "/service-role/"
    policy_file = "sagemaker_use_role.json"
  }
  aws_iam_policy_4 = {
    name        = "Cognito-1690255817691"
    path        = "/service-role/"
    policy_file = "cognito.json"
  }
}

iam_roles = {
  awsserviceroleforamazonelasticfilesystem = {
    name                 = "AWSServiceRoleForAmazonElasticFileSystem"
    path                 = "/aws-service-role/elasticfilesystem.amazonaws.com/"
    max_session_duration = 3600
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"elasticfilesystem.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  }
  awsserviceroleforapigateway = {
    name                 = "AWSServiceRoleForAPIGateway"
    path                 = "/aws-service-role/ops.apigateway.amazonaws.com/"
    description          = "The Service Linked Role is used by Amazon API Gateway."
    max_session_duration = 3600
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ops.apigateway.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  }
  awsserviceroleforamazonsagemakernotebooks = {
    name                 = "AWSServiceRoleForAmazonSageMakerNotebooks"
    path                 = "/aws-service-role/sagemaker.amazonaws.com/"
    description          = "AWS SageMaker Notebooks Service Linked Role"
    max_session_duration = 3600
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"sagemaker.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  }
  awsserviceroleforsupport = {
    name                 = "AWSServiceRoleForSupport"
    path                 = "/aws-service-role/support.amazonaws.com/"
    description          = "Enables resource access for AWS to provide billing, administrative and support services"
    max_session_duration = 3600
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"support.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  }
  awsservicerolefortrustedadvisor = {
    name                 = "AWSServiceRoleForTrustedAdvisor"
    path                 = "/aws-service-role/trustedadvisor.amazonaws.com/"
    description          = "Access for the AWS Trusted Advisor Service to help reduce cost, increase performance, and improve security of your AWS environment."
    max_session_duration = 3600
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"trustedadvisor.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  }
  refeed_infra_dash_readonly = {
    name                 = "refeed-infra-dash-readonly"
    path                 = "/"
    max_session_duration = 3600
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::714114208215:root\"},\"Action\":\"sts:AssumeRole\"}]}"
  }
  amazonsagemaker_executionrole_20231125t142640 = {
    name                 = "AmazonSageMaker-ExecutionRole-20231125T142640"
    path                 = "/service-role/"
    description          = "SageMaker execution role created from the SageMaker AWS Management Console."
    max_session_duration = 3600
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"sagemaker.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  }
  amazonsagemakerservicecatalogproductsapigatewayrole = {
    name                 = "AmazonSageMakerServiceCatalogProductsApiGatewayRole"
    path                 = "/service-role/"
    description          = "SageMaker role created from the SageMaker AWS Management Console. This role will grant permissions required to use AWS ApiGateway within the Amazon SageMaker portfolio of products."
    max_session_duration = 3600
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"apigateway.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  }
  amazonsagemakerservicecatalogproductscloudformationrole = {
    name                 = "AmazonSageMakerServiceCatalogProductsCloudformationRole"
    path                 = "/service-role/"
    description          = "SageMaker role created from the SageMaker AWS Management Console. This role will grant permissions required to use AWS CloudFormation within the Amazon SageMaker portfolio of products."
    max_session_duration = 3600
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"cloudformation.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  }
  amazonsagemakerservicecatalogproductscodebuildrole = {
    name                 = "AmazonSageMakerServiceCatalogProductsCodeBuildRole"
    path                 = "/service-role/"
    description          = "SageMaker role created from the SageMaker AWS Management Console. This role will grant permissions required to use AWS CodeBuild within the Amazon SageMaker portfolio of products."
    max_session_duration = 3600
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"codebuild.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  }
  amazonsagemakerservicecatalogproductscodepipelinerole = {
    name                 = "AmazonSageMakerServiceCatalogProductsCodePipelineRole"
    path                 = "/service-role/"
    description          = "SageMaker role created from the SageMaker AWS Management Console. This role will grant permissions required to use AWS CodePipeline within the Amazon SageMaker portfolio of products."
    max_session_duration = 3600
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"codepipeline.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  }
  amazonsagemakerservicecatalogproductseventsrole = {
    name                 = "AmazonSageMakerServiceCatalogProductsEventsRole"
    path                 = "/service-role/"
    description          = "SageMaker role created from the SageMaker AWS Management Console. This role will grant permissions required to use AWS Events within the Amazon SageMaker portfolio of products."
    max_session_duration = 3600
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"events.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  }
  amazonsagemakerservicecatalogproductsexecutionrole = {
    name                 = "AmazonSageMakerServiceCatalogProductsExecutionRole"
    path                 = "/service-role/"
    description          = "SageMaker role created from the SageMaker AWS Management Console. This role will grant permissions required to use AWS SageMaker within the Amazon SageMaker portfolio of products."
    max_session_duration = 3600
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"sagemaker.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  }
  amazonsagemakerservicecatalogproductsfirehoserole = {
    name                 = "AmazonSageMakerServiceCatalogProductsFirehoseRole"
    path                 = "/service-role/"
    description          = "SageMaker role created from the SageMaker AWS Management Console. This role will grant permissions required to use AWS Firehose within the Amazon SageMaker portfolio of products."
    max_session_duration = 3600
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"firehose.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  }
  amazonsagemakerservicecatalogproductsgluerole = {
    name                 = "AmazonSageMakerServiceCatalogProductsGlueRole"
    path                 = "/service-role/"
    description          = "SageMaker role created from the SageMaker AWS Management Console. This role will grant permissions required to use AWS Glue within the Amazon SageMaker portfolio of products."
    max_session_duration = 3600
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"glue.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  }
  amazonsagemakerservicecatalogproductslambdarole = {
    name                 = "AmazonSageMakerServiceCatalogProductsLambdaRole"
    path                 = "/service-role/"
    description          = "SageMaker role created from the SageMaker AWS Management Console. This role will grant permissions required to use AWS Lambda within the Amazon SageMaker portfolio of products."
    max_session_duration = 3600
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"lambda.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  }
  amazonsagemakerservicecatalogproductslaunchrole = {
    name                 = "AmazonSageMakerServiceCatalogProductsLaunchRole"
    path                 = "/service-role/"
    description          = "SageMaker role created from the SageMaker AWS Management Console. This role has the permissions required to launch the Amazon SageMaker portfolio of products from AWS ServiceCatalog."
    max_session_duration = 3600
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"servicecatalog.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  }
  amazonsagemakerservicecatalogproductsuserole = {
    name                 = "AmazonSageMakerServiceCatalogProductsUseRole"
    path                 = "/service-role/"
    description          = "SageMaker role created from the SageMaker AWS Management Console. This role has the permissions required to use the Amazon SageMaker portfolio of products from AWS ServiceCatalog."
    max_session_duration = 3600
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"sagemaker.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  }
  amazonsagemakercanvasforecastrole_20231125t142640 = {
    name                 = "AmazonSagemakerCanvasForecastRole-20231125T142640"
    path                 = "/service-role/"
    max_session_duration = 3600
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"forecast.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  }
  stulyze_sms = {
    name                 = "stulyze-sms"
    path                 = "/service-role/"
    max_session_duration = 3600
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"cognito-idp.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  }
}

vpc = {
  cidr_block       = "172.31.0.0/16"
  instance_tenancy = "default"
}

subnets = {
  aws_subnet_1 = {
    cidr_block              = "172.31.16.0/20"
    availability_zone       = "ap-southeast-1b"
    vpc_id                  = "vpc-05fed6e9ac0f64a6e"
    map_public_ip_on_launch = true
  }
  aws_subnet_2 = {
    cidr_block              = "172.31.0.0/20"
    availability_zone       = "ap-southeast-1c"
    vpc_id                  = "vpc-05fed6e9ac0f64a6e"
    map_public_ip_on_launch = true
  }
  aws_subnet_3 = {
    cidr_block              = "172.31.32.0/20"
    availability_zone       = "ap-southeast-1a"
    vpc_id                  = "vpc-05fed6e9ac0f64a6e"
    map_public_ip_on_launch = true
  }
}

security_groups = {
  security_group_for_outbound_nfs_d_e7rysy0e6m17 = {
    name        = "security-group-for-outbound-nfs-d-e7rysy0e6m17"
    description = "[DO NOT DELETE] Security Group that allows outbound NFS traffic for SageMaker Notebooks Domain [d-e7rysy0e6m17]"
    vpc_id      = "vpc-05fed6e9ac0f64a6e"
    tags        = { "ManagedByAmazonSageMakerResource" = "arn:aws:sagemaker:ap-southeast-1:714114208215:domain/d-e7rysy0e6m17" }
  }
  default = {
    name        = "default"
    description = "default VPC security group"
    vpc_id      = "vpc-05fed6e9ac0f64a6e"
  }
  security_group_for_inbound_nfs_d_e7rysy0e6m17 = {
    name        = "security-group-for-inbound-nfs-d-e7rysy0e6m17"
    description = "[DO NOT DELETE] Security Group that allows inbound NFS traffic for SageMaker Notebooks Domain [d-e7rysy0e6m17]"
    vpc_id      = "vpc-05fed6e9ac0f64a6e"
    tags        = { "ManagedByAmazonSageMakerResource" = "arn:aws:sagemaker:ap-southeast-1:714114208215:domain/d-e7rysy0e6m17" }
  }
}

internet_gateway = {
  vpc_id = "vpc-05fed6e9ac0f64a6e"
}

route_table = {
  vpc_id = "vpc-05fed6e9ac0f64a6e"
  routes = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = "igw-02aec4b4978ee2879"
    }
  ]
}

network_acl = {
  default_network_acl_id = "acl-0b1b4715940488f98"
  ingress_rules = [
    {
      rule_no    = 100
      protocol   = "-1"
      action     = "allow"
      cidr_block = "0.0.0.0/0"
      from_port  = 0
      to_port    = 0
    }
  ]
  egress_rules = [
    {
      rule_no    = 100
      protocol   = "-1"
      action     = "allow"
      cidr_block = "0.0.0.0/0"
      from_port  = 0
      to_port    = 0
    }
  ]
}
