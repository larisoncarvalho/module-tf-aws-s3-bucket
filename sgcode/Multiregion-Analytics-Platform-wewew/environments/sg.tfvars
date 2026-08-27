# Athena Workgroup
athena_workgroup_name                               = "primary"
athena_workgroup_description                        = ""
athena_workgroup_state                              = "ENABLED"
athena_workgroup_enforce_workgroup_configuration    = false
athena_workgroup_publish_cloudwatch_metrics_enabled = true
athena_workgroup_requester_pays_enabled             = false

# CloudFormation Stack
cloudformation_stack_name             = "stulyze-app"
cloudformation_stack_disable_rollback = false

# IAM Policies
iam_policies = {
  "all" = {
    name   = "All"
    path   = "/"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Sid\":\"VisualEditor0\",\"Effect\":\"Allow\",\"Action\":\"*\",\"Resource\":\"*\"}]}"
  }
  "amazonsagemaker_executionpolicy_20231125t142640" = {
    name   = "AmazonSageMaker-ExecutionPolicy-20231125T142640"
    path   = "/service-role/"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Action\":[\"s3:GetObject\",\"s3:PutObject\",\"s3:DeleteObject\",\"s3:ListBucket\"],\"Resource\":[\"arn:aws:s3:::*\"]}]}"
  }
  "amazonsagemakerservicecatalogproductsuserole_20231125t142608" = {
    name   = "AmazonSageMakerServiceCatalogProductsUseRole-20231125T142608"
    path   = "/service-role/"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Action\":[\"cloudformation:CreateChangeSet\",\"cloudformation:CreateStack\",\"cloudformation:DescribeChangeSet\",\"cloudformation:DeleteChangeSet\",\"cloudformation:DeleteStack\",\"cloudformation:DescribeStacks\",\"cloudformation:ExecuteChangeSet\",\"cloudformation:SetStackPolicy\",\"cloudformation:UpdateStack\"],\"Resource\":\"arn:aws:cloudformation:*:*:stack/sagemaker-*\"},{\"Effect\":\"Allow\",\"Action\":[\"cloudwatch:PutMetricData\"],\"Resource\":\"*\"},{\"Effect\":\"Allow\",\"Action\":[\"codebuild:BatchGetBuilds\",\"codebuild:StartBuild\"],\"Resource\":[\"arn:aws:codebuild:*:*:project/sagemaker-*\",\"arn:aws:codebuild:*:*:build/sagemaker-*\"]},{\"Effect\":\"Allow\",\"Action\":[\"codecommit:CancelUploadArchive\",\"codecommit:GetBranch\",\"codecommit:GetCommit\",\"codecommit:GetUploadArchiveStatus\",\"codecommit:UploadArchive\"],\"Resource\":\"arn:aws:codecommit:*:*:sagemaker-*\"},{\"Effect\":\"Allow\",\"Action\":[\"codepipeline:StartPipelineExecution\"],\"Resource\":\"arn:aws:codepipeline:*:*:sagemaker-*\"},{\"Effect\":\"Allow\",\"Action\":[\"ec2:DescribeRouteTables\"],\"Resource\":\"*\"},{\"Effect\":\"Allow\",\"Action\":[\"ecr:BatchCheckLayerAvailability\",\"ecr:BatchGetImage\",\"ecr:Describe*\",\"ecr:GetAuthorizationToken\",\"ecr:GetDownloadUrlForLayer\"],\"Resource\":\"*\"},{\"Effect\":\"Allow\",\"Action\":[\"ecr:BatchDeleteImage\",\"ecr:CompleteLayerUpload\",\"ecr:CreateRepository\",\"ecr:DeleteRepository\",\"ecr:InitiateLayerUpload\",\"ecr:PutImage\",\"ecr:UploadLayerPart\"],\"Resource\":[\"arn:aws:ecr:*:*:repository/sagemaker-*\"]},{\"Effect\":\"Allow\",\"Action\":[\"events:DeleteRule\",\"events:DescribeRule\",\"events:PutRule\",\"events:PutTargets\",\"events:RemoveTargets\"],\"Resource\":[\"arn:aws:events:*:*:rule/sagemaker-*\"]},{\"Effect\":\"Allow\",\"Action\":[\"firehose:PutRecord\",\"firehose:PutRecordBatch\"],\"Resource\":\"arn:aws:firehose:*:*:deliverystream/sagemaker-*\"},{\"Effect\":\"Allow\",\"Action\":[\"glue:BatchCreatePartition\",\"glue:BatchDeletePartition\",\"glue:BatchDeleteTable\",\"glue:BatchDeleteTableVersion\",\"glue:BatchGetPartition\",\"glue:CreateDatabase\",\"glue:CreatePartition\",\"glue:CreateTable\",\"glue:DeletePartition\",\"glue:DeleteTable\",\"glue:DeleteTableVersion\",\"glue:GetDatabase\",\"glue:GetPartition\",\"glue:GetPartitions\",\"glue:GetTable\",\"glue:GetTables\",\"glue:GetTableVersion\",\"glue:GetTableVersions\",\"glue:SearchTables\",\"glue:UpdatePartition\",\"glue:UpdateTable\",\"glue:GetUserDefinedFunctions\"],\"Resource\":[\"arn:aws:glue:*:*:catalog\",\"arn:aws:glue:*:*:database/default\",\"arn:aws:glue:*:*:database/global_temp\",\"arn:aws:glue:*:*:database/sagemaker-*\",\"arn:aws:glue:*:*:table/sagemaker-*\",\"arn:aws:glue:*:*:tableVersion/sagemaker-*\"]},{\"Effect\":\"Allow\",\"Action\":[\"iam:PassRole\"],\"Resource\":[\"arn:aws:iam::*:role/service-role/AmazonSageMakerServiceCatalogProductsUse*\"]},{\"Effect\":\"Allow\",\"Action\":[\"lambda:InvokeFunction\"],\"Resource\":[\"arn:aws:lambda:*:*:function:sagemaker-*\"]},{\"Effect\":\"Allow\",\"Action\":[\"logs:CreateLogDelivery\",\"logs:CreateLogGroup\",\"logs:CreateLogStream\",\"logs:DeleteLogDelivery\",\"logs:Describe*\",\"logs:GetLogDelivery\",\"logs:GetLogEvents\",\"logs:ListLogDeliveries\",\"logs:PutLogEvents\",\"logs:PutResourcePolicy\",\"logs:UpdateLogDelivery\"],\"Resource\":\"*\"},{\"Effect\":\"Allow\",\"Action\":[\"s3:CreateBucket\",\"s3:DeleteBucket\",\"s3:GetBucketAcl\",\"s3:GetBucketCors\",\"s3:GetBucketLocation\",\"s3:ListAllMyBuckets\",\"s3:ListBucket\",\"s3:ListBucketMultipartUploads\",\"s3:PutBucketCors\",\"s3:PutObjectAcl\"],\"Resource\":[\"arn:aws:s3:::aws-glue-*\",\"arn:aws:s3:::sagemaker-*\"]},{\"Effect\":\"Allow\",\"Action\":[\"s3:AbortMultipartUpload\",\"s3:DeleteObject\",\"s3:GetObject\",\"s3:GetObjectVersion\",\"s3:PutObject\"],\"Resource\":[\"arn:aws:s3:::aws-glue-*\",\"arn:aws:s3:::sagemaker-*\"]},{\"Effect\":\"Allow\",\"Action\":[\"sagemaker:*\"],\"NotResource\":[\"arn:aws:sagemaker:*:*:domain/*\",\"arn:aws:sagemaker:*:*:user-profile/*\",\"arn:aws:sagemaker:*:*:app/*\",\"arn:aws:sagemaker:*:*:flow-definition/*\"]},{\"Effect\":\"Allow\",\"Action\":[\"states:DescribeExecution\",\"states:DescribeStateMachine\",\"states:DescribeStateMachineForExecution\",\"states:GetExecutionHistory\",\"states:ListExecutions\",\"states:ListTagsForResource\",\"states:StartExecution\",\"states:StopExecution\",\"states:TagResource\",\"states:UntagResource\",\"states:UpdateStateMachine\"],\"Resource\":[\"arn:aws:states:*:*:stateMachine:sagemaker-*\",\"arn:aws:states:*:*:execution:sagemaker-*:*\"]},{\"Effect\":\"Allow\",\"Action\":[\"states:ListStateMachines\"],\"Resource\":\"*\"},{\"Effect\":\"Allow\",\"Action\":[\"codestar-connections:UseConnection\"],\"Resource\":\"arn:aws:codestar-connections:*:*:connection/*\",\"Condition\":{\"StringEqualsIgnoreCase\":{\"aws:ResourceTag/sagemaker\":\"true\"}}}]}"
  }
  "aws_iam_policy_4" = {
    name   = "Cognito-1690255817691"
    path   = "/service-role/"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Action\":[\"sns:publish\"],\"Resource\":[\"*\"]}]}"
  }
}

# IAM Roles
iam_roles = {
  "awsserviceroleforamazonelasticfilesystem" = {
    name                 = "AWSServiceRoleForAmazonElasticFileSystem"
    path                 = "/aws-service-role/elasticfilesystem.amazonaws.com/"
    description          = null
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"elasticfilesystem.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
    max_session_duration = 3600
  }
  "awsserviceroleforapigateway" = {
    name                 = "AWSServiceRoleForAPIGateway"
    path                 = "/aws-service-role/ops.apigateway.amazonaws.com/"
    description          = "The Service Linked Role is used by Amazon API Gateway."
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ops.apigateway.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
    max_session_duration = 3600
  }
  "awsserviceroleforamazonsagemakernotebooks" = {
    name                 = "AWSServiceRoleForAmazonSageMakerNotebooks"
    path                 = "/aws-service-role/sagemaker.amazonaws.com/"
    description          = "AWS SageMaker Notebooks Service Linked Role"
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"sagemaker.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
    max_session_duration = 3600
  }
  "awsserviceroleforsupport" = {
    name                 = "AWSServiceRoleForSupport"
    path                 = "/aws-service-role/support.amazonaws.com/"
    description          = "Enables resource access for AWS to provide billing, administrative and support services"
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"support.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
    max_session_duration = 3600
  }
}

# Internet Gateway
internet_gateway_vpc_id = "vpc-05fed6e9ac0f64a6e"

# Default Subnets
default_subnets = {
  "aws_subnet_1" = {
    availability_zone       = "ap-southeast-1b"
    map_public_ip_on_launch = true
  }
  "aws_subnet_2" = {
    availability_zone       = "ap-southeast-1a"
    map_public_ip_on_launch = true
  }
}

# Security Groups (non-default) - phantom SageMaker NFS SGs removed (no longer exist)
security_groups = {}

# Default Security Group
default_security_group_vpc_id = "vpc-05fed6e9ac0f64a6e"
default_security_group_ingress = [
  {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = []
    self            = true
    security_groups = []
  }
]
default_security_group_egress = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

# Route Table
route_table_vpc_id = "vpc-05fed6e9ac0f64a6e"
route_table_routes = [
  {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-02aec4b4978ee2879"
  }
]

# Default Network ACL
default_network_acl_id = "acl-0b1b4715940488f98"
default_network_acl_subnet_ids = [
  "subnet-0df3e594471580676",
  "subnet-0aec9ccc3d679b626",
  "subnet-0aee82bad124320d3"
]
default_network_acl_ingress = [
  {
    rule_no    = 100
    action     = "allow"
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
]
default_network_acl_egress = [
  {
    rule_no    = 100
    action     = "allow"
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
]

# Keyspaces - ap-southeast-1
keyspaces_ap_southeast_1 = {
  "system" = {
    name                 = "system"
    replication_strategy = "SINGLE_REGION"
  }
  "system_schema_mcs" = {
    name                 = "system_schema_mcs"
    replication_strategy = "SINGLE_REGION"
  }
}

# Keyspaces - eu-central-1
keyspaces_eu_central_1 = {
  "system" = {
    name                 = "system"
    replication_strategy = "SINGLE_REGION"
  }
  "system_multiregion_info" = {
    name                 = "system_multiregion_info"
    replication_strategy = "SINGLE_REGION"
  }
}

# Keyspaces - us-west-1
keyspaces_us_west_1 = {
  "system_schema_mcs" = {
    name                 = "system_schema_mcs"
    replication_strategy = "SINGLE_REGION"
  }
}
