region = "eu-central-1"

api_gateway_name                         = "api-gateway-demo"
api_gateway_protocol_type                = "HTTP"
api_gateway_api_key_selection_expression = "$request.header.x-api-key"
api_gateway_route_selection_expression   = "$request.method $request.path"
api_gateway_disable_execute_api_endpoint = false

athena_workgroup_name                     = "primary"
athena_workgroup_state                    = "ENABLED"
athena_enforce_workgroup_configuration    = false
athena_publish_cloudwatch_metrics_enabled = false
athena_requester_pays_enabled             = false
athena_selected_engine_version            = "AUTO"

asg_name                            = "TOBY_SG_RUNNER-private-runner-asg"
asg_max_size                        = 3
asg_min_size                        = 1
asg_desired_capacity                = 1
asg_health_check_grace_period       = 300
asg_health_check_type               = "EC2"
asg_default_cooldown                = 300
asg_default_instance_warmup         = 0
asg_protect_from_scale_in           = false
asg_capacity_rebalance              = false
asg_metrics_granularity             = "1Minute"
asg_service_linked_role_arn         = "arn:aws:iam::871606792318:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
asg_vpc_zone_identifier             = ["subnet-0efb59344208ad885"]
asg_launch_template_id              = "lt-078a77f9c58dbd2ee"
asg_launch_template_name            = "TOBY_SG_RUNNER-private-runner-20251222130639011300000001"
asg_launch_template_version         = "$Latest"
asg_capacity_distribution_strategy  = "balanced-best-effort"
asg_capacity_reservation_preference = "default"

cloudformation_stacks = {
  cdk_toolkit = {
    name             = "CDKToolkit"
    capabilities     = ["CAPABILITY_IAM", "CAPABILITY_NAMED_IAM", "CAPABILITY_AUTO_EXPAND"]
    disable_rollback = false
    parameters = {
      FileAssetsBucketKmsKeyId       = "AWS_MANAGED_KEY"
      PublicAccessBlockConfiguration = "true"
      UseExamplePermissionsBoundary  = "false"
      BootstrapVariant               = "AWS CDK: Default Resources"
      DenyExternalId                 = "true"
      Qualifier                      = "hnb659fds"
    }
  }
  cloudformation_sg = {
    name             = "Cloudformation-SG"
    capabilities     = []
    disable_rollback = false
    parameters = {
      PrivateSubnet1CIDR = "10.20.30.0/24"
      PublicSubnet3CIDR  = "10.20.25.0/24"
      PublicSubnet2CIDR  = "10.20.20.0/24"
      VpcCIDR            = "10.20.0.0/16"
      ProjectName        = "stackguardian"
      EnvironmentName    = "dev2"
      PrivateSubnet2CIDR = "10.20.40.0/24"
      PublicSubnet1CIDR  = "10.20.10.0/24"
    }
  }
  stackset_stacktester = {
    name             = "StackSet-stacktester-7ee8ac7b-dab6-4835-9784-6e553f44056e"
    capabilities     = ["CAPABILITY_NAMED_IAM"]
    disable_rollback = false
    parameters = {
      ExternalID      = "04983483484"
      SGRoleName      = "stack-tester-delte"
      CustomPolicyARN = "arn:aws:iam::aws:policy/IAMReadOnlyAccess"
    }
  }
  awsconfigconforms_eks_best_practise = {
    name             = "awsconfigconforms-EKS-best-practise-conformance-pack-iwpe9mndl"
    capabilities     = []
    disable_rollback = false
    parameters = {
      EksClusterOldestSupportedVersionParamOldestVersionSupported = "1.2"
      EksClusterSupportedVersionParamOldestVersionSupported       = "1.2"
    }
  }
  stack_my_test = {
    name             = "stack-my-test"
    capabilities     = ["CAPABILITY_NAMED_IAM"]
    disable_rollback = false
    parameters = {
      ExternalID      = "12121212212q21"
      SGRoleName      = "StackGuardian001"
      CustomPolicyARN = "arn:aws:iam::871606792318:policy/eksFullAccess"
    }
  }
}

config_rules = {
  eks_cluster_oldest_supported_version_conformance_pack_iwpe9mndl = {
    name                        = "eks-cluster-oldest-supported-version-conformance-pack-iwpe9mndl"
    description                 = ""
    input_parameters            = "{\"oldestVersionSupported\":\"1.2\"}"
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::EKS::Cluster"]
    }
    source_owner      = "AWS"
    source_identifier = "EKS_CLUSTER_OLDEST_SUPPORTED_VERSION"
    evaluation_mode   = "DETECTIVE"
  }
  eks_cluster_supported_version_conformance_pack_iwpe9mndl = {
    name                        = "eks-cluster-supported-version-conformance-pack-iwpe9mndl"
    description                 = ""
    input_parameters            = "{\"oldestVersionSupported\":\"1.2\"}"
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::EKS::Cluster"]
    }
    source_owner      = "AWS"
    source_identifier = "EKS_CLUSTER_SUPPORTED_VERSION"
    evaluation_mode   = "DETECTIVE"
  }
  eks_secrets_encrypted_conformance_pack_iwpe9mndl = {
    name                        = "eks-secrets-encrypted-conformance-pack-iwpe9mndl"
    description                 = ""
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = []
    }
    source_owner      = "AWS"
    source_identifier = "EKS_SECRETS_ENCRYPTED"
    evaluation_mode   = "DETECTIVE"
  }
  eks_endpoint_no_public_access_conformance_pack_iwpe9mndl = {
    name                        = "eks-endpoint-no-public-access-conformance-pack-iwpe9mndl"
    description                 = ""
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = []
    }
    source_owner      = "AWS"
    source_identifier = "EKS_ENDPOINT_NO_PUBLIC_ACCESS"
    evaluation_mode   = "DETECTIVE"
  }
  s3_bucket_public_read_prohibited = {
    name                        = "s3-bucket-public-read-prohibited"
    description                 = "Checks that your Amazon S3 buckets do not allow public read access. The rule checks the Block Public Access settings, the bucket policy, and the bucket access control list (ACL)."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = ["AWS::S3::Bucket"]
    }
    source_owner      = "AWS"
    source_identifier = "S3_BUCKET_PUBLIC_READ_PROHIBITED"
    evaluation_mode   = "DETECTIVE"
  }
  ec2_instance_managed_by_systems_manager = {
    name                        = "ec2-instance-managed-by-systems-manager"
    description                 = "Checks if your Amazon EC2 instances are managed by AWS Systems Manager (SSM Agent). The rule is NON_COMPLIANT if the EC2 instance previously associated with an SSM Agent instance inventory becomes unreachable or is not managed by SSM Agent."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::EC2::Instance", "AWS::SSM::ManagedInstanceInventory"]
    }
    source_owner      = "AWS"
    source_identifier = "EC2_INSTANCE_MANAGED_BY_SSM"
    evaluation_mode   = "DETECTIVE"
  }
  api_gw_cache_enabled_and_encrypted = {
    name                        = "api-gw-cache-enabled-and-encrypted"
    description                 = "Checks if all methods in Amazon API Gateway stages have cache enabled and cache encrypted. The rule is NON_COMPLIANT if any method in an Amazon API Gateway stage is not configured to cache or the cache is not encrypted."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::ApiGateway::Stage"]
    }
    source_owner      = "AWS"
    source_identifier = "API_GW_CACHE_ENABLED_AND_ENCRYPTED"
    evaluation_mode   = "DETECTIVE"
  }
  secretsmanager_secret_unused = {
    name                        = "secretsmanager-secret-unused"
    description                 = "Checks if AWS Secrets Manager secrets have been accessed in the past 90 days. This rule is NON_COMPLIANT if a secret has not been accessed in 90 days."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = ["AWS::SecretsManager::Secret"]
    }
    source_owner      = "AWS"
    source_identifier = "SECRETSMANAGER_SECRET_UNUSED"
    evaluation_mode   = "DETECTIVE"
  }
  guardduty_enabled_centralized = {
    name                        = "guardduty-enabled-centralized"
    description                 = "Checks if Amazon GuardDuty is enabled in your AWS account and AWS Region. If you provide an AWS account for centralization, the rule evaluates the GuardDuty results in the centralized account. The rule is COMPLIANT when GuardDuty is enabled."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = []
    }
    source_owner      = "AWS"
    source_identifier = "GUARDDUTY_ENABLED_CENTRALIZED"
    evaluation_mode   = "DETECTIVE"
  }
  dynamodb_table_encrypted_kms = {
    name                        = "dynamodb-table-encrypted-kms"
    description                 = "Checks whether Amazon DynamoDB table is encrypted with AWS Key Management Service (KMS). The rule is NON_COMPLIANT if Amazon DynamoDB table is not encrypted with AWS KMS."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::DynamoDB::Table"]
    }
    source_owner      = "AWS"
    source_identifier = "DYNAMODB_TABLE_ENCRYPTED_KMS"
    evaluation_mode   = "DETECTIVE"
  }
  elasticsearch_in_vpc_only = {
    name                        = "elasticsearch-in-vpc-only"
    description                 = "Checks if Amazon OpenSearch Service (previously called Elasticsearch) domains are in Amazon Virtual Private Cloud (Amazon VPC). The rule is NON_COMPLIANT if an OpenSearch Service domain endpoint is public."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = ["AWS::Elasticsearch::Domain"]
    }
    source_owner      = "AWS"
    source_identifier = "ELASTICSEARCH_IN_VPC_ONLY"
    evaluation_mode   = "DETECTIVE"
  }
  vpc_default_security_group_closed = {
    name                        = "vpc-default-security-group-closed"
    description                 = "Checks if the default security group of any Amazon Virtual Private Cloud (Amazon VPC) does not allow inbound or outbound traffic. The rule is NON_COMPLIANT if the default security group has one or more inbound or outbound traffic rules."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::EC2::SecurityGroup"]
    }
    source_owner      = "AWS"
    source_identifier = "VPC_DEFAULT_SECURITY_GROUP_CLOSED"
    evaluation_mode   = "DETECTIVE"
  }
  ec2_stopped_instance = {
    name                        = "ec2-stopped-instance"
    description                 = "Checks whether there are instances stopped for more than the allowed number of days."
    input_parameters            = "{\"AllowedDays\":\"30\"}"
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = ["AWS::EC2::Instance"]
    }
    source_owner      = "AWS"
    source_identifier = "EC2_STOPPED_INSTANCE"
    evaluation_mode   = "DETECTIVE"
  }
  vpc_flow_logs_enabled = {
    name                        = "vpc-flow-logs-enabled"
    description                 = "Checks if Amazon Virtual Private Cloud (Amazon VPC) flow logs are found and enabled for all Amazon VPCs. The rule is NON_COMPLIANT if flow logs are not enabled for at least one Amazon VPC."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = ["AWS::EC2::VPC"]
    }
    source_owner      = "AWS"
    source_identifier = "VPC_FLOW_LOGS_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  s3_bucket_versioning_enabled = {
    name                        = "s3-bucket-versioning-enabled"
    description                 = "Checks whether versioning is enabled for your S3 buckets."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::S3::Bucket"]
    }
    source_owner      = "AWS"
    source_identifier = "S3_BUCKET_VERSIONING_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  dynamodb_pitr_enabled = {
    name                        = "dynamodb-pitr-enabled"
    description                 = "Checks if point-in-time recovery (PITR) is enabled for Amazon DynamoDB tables. The rule is NON_COMPLIANT if PITR is not enabled for DynamoDB tables."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::DynamoDB::Table"]
    }
    source_owner      = "AWS"
    source_identifier = "DYNAMODB_PITR_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  s3_bucket_level_public_access_prohibited = {
    name                        = "s3-bucket-level-public-access-prohibited"
    description                 = "Checks if S3 buckets are publicly accessible. The rule is NON_COMPLIANT if an S3 bucket is not listed in the excludedPublicBuckets parameter and bucket level settings are public."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::S3::Bucket"]
    }
    source_owner      = "AWS"
    source_identifier = "S3_BUCKET_LEVEL_PUBLIC_ACCESS_PROHIBITED"
    evaluation_mode   = "DETECTIVE"
  }
  ec2_imdsv2_check = {
    name                        = "ec2-imdsv2-check"
    description                 = "Checks if your Amazon Elastic Compute Cloud (Amazon EC2) instance metadata version is configured with Instance Metadata Service Version 2 (IMDSv2). The rule is NON_COMPLIANT if the HttpTokens is set to optional."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::EC2::Instance"]
    }
    source_owner      = "AWS"
    source_identifier = "EC2_IMDSV2_CHECK"
    evaluation_mode   = "DETECTIVE"
  }
  ec2_security_group_attached_to_eni = {
    name                        = "ec2-security-group-attached-to-eni"
    description                 = "Checks if non-default security groups are attached to elastic network interfaces. The rule is NON_COMPLIANT if the security group is not associated with a network interface."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::EC2::SecurityGroup"]
    }
    source_owner      = "AWS"
    source_identifier = "EC2_SECURITY_GROUP_ATTACHED_TO_ENI"
    evaluation_mode   = "DETECTIVE"
  }
  lambda_function_public_access_prohibited = {
    name                        = "lambda-function-public-access-prohibited"
    description                 = "Checks whether the Lambda function policy prohibits public access."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::Lambda::Function"]
    }
    source_owner      = "AWS"
    source_identifier = "LAMBDA_FUNCTION_PUBLIC_ACCESS_PROHIBITED"
    evaluation_mode   = "DETECTIVE"
  }
  rds_cluster_deletion_protection_enabled = {
    name                        = "rds-cluster-deletion-protection-enabled"
    description                 = "Checks if an Amazon Relational Database Service (Amazon RDS) cluster has deletion protection enabled. The rule is NON_COMPLIANT if an Amazon RDS cluster does not have deletion protection enabled."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::RDS::DBCluster"]
    }
    source_owner      = "AWS"
    source_identifier = "RDS_CLUSTER_DELETION_PROTECTION_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  rds_snapshot_encrypted = {
    name                        = "rds-snapshot-encrypted"
    description                 = "Checks if Amazon Relational Database Service (Amazon RDS) DB snapshots are encrypted. The rule is NON_COMPLIANT if the Amazon RDS DB snapshots are not encrypted."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::RDS::DBSnapshot", "AWS::RDS::DBClusterSnapshot"]
    }
    source_owner      = "AWS"
    source_identifier = "RDS_SNAPSHOT_ENCRYPTED"
    evaluation_mode   = "DETECTIVE"
  }
  s3_bucket_public_write_prohibited = {
    name                        = "s3-bucket-public-write-prohibited"
    description                 = "Checks that your Amazon S3 buckets do not allow public write access. The rule checks the Block Public Access settings, the bucket policy, and the bucket access control list (ACL)."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = ["AWS::S3::Bucket"]
    }
    source_owner      = "AWS"
    source_identifier = "S3_BUCKET_PUBLIC_WRITE_PROHIBITED"
    evaluation_mode   = "DETECTIVE"
  }
  secretsmanager_scheduled_rotation_success_check = {
    name                        = "secretsmanager-scheduled-rotation-success-check"
    description                 = "Checks and verifies whether AWS Secret Manager secret rotation has rotated successfully as per the rotation schedule."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::SecretsManager::Secret"]
    }
    source_owner      = "AWS"
    source_identifier = "SECRETSMANAGER_SCHEDULED_ROTATION_SUCCESS_CHECK"
    evaluation_mode   = "DETECTIVE"
  }
  ec2_volume_inuse_check = {
    name                        = "ec2-volume-inuse-check"
    description                 = "Checks whether EBS volumes are attached to EC2 instances."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::EC2::Volume"]
    }
    source_owner      = "AWS"
    source_identifier = "EC2_VOLUME_INUSE_CHECK"
    evaluation_mode   = "DETECTIVE"
  }
  secretsmanager_rotation_enabled_check = {
    name                        = "secretsmanager-rotation-enabled-check"
    description                 = "Checks whether AWS Secret Manager secret has rotation enabled. If the maximumAllowedRotationFrequency or the maximumAllowedRotationFrequencyInHours parameter is specified, the rotation frequency of the secret is compared with the maximum allowed frequency."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::SecretsManager::Secret"]
    }
    source_owner      = "AWS"
    source_identifier = "SECRETSMANAGER_ROTATION_ENABLED_CHECK"
    evaluation_mode   = "DETECTIVE"
  }
  s3_bucket_ssl_requests_only = {
    name                        = "s3-bucket-ssl-requests-only"
    description                 = "Checks if S3 buckets have policies that require requests to use SSL/TLS. The rule is NON_COMPLIANT if any S3 bucket has policies allowing HTTP requests."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::S3::Bucket"]
    }
    source_owner      = "AWS"
    source_identifier = "S3_BUCKET_SSL_REQUESTS_ONLY"
    evaluation_mode   = "DETECTIVE"
  }
  efs_in_backup_plan = {
    name                        = "efs-in-backup-plan"
    description                 = "Checks if Amazon Elastic File System (Amazon EFS) file systems are added in the backup plans of AWS Backup. The rule is NON_COMPLIANT if EFS file systems are not included in the backup plans."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = ["AWS::EFS::FileSystem"]
    }
    source_owner      = "AWS"
    source_identifier = "EFS_IN_BACKUP_PLAN"
    evaluation_mode   = "DETECTIVE"
  }
  mfa_enabled_for_iam_console_access = {
    name                        = "mfa-enabled-for-iam-console-access"
    description                 = "Checks if AWS multi-factor authentication (MFA) is enabled for all AWS Identity and Access Management (IAM) users that use a console password. The rule is COMPLIANT if MFA is enabled."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = ["AWS::IAM::User"]
    }
    source_owner      = "AWS"
    source_identifier = "MFA_ENABLED_FOR_IAM_CONSOLE_ACCESS"
    evaluation_mode   = "DETECTIVE"
  }
  rds_enhanced_monitoring_enabled = {
    name                        = "rds-enhanced-monitoring-enabled"
    description                 = "Checks if enhanced monitoring is enabled for Amazon RDS instances. This rule is NON_COMPLIANT if 'monitoringInterval' is '0' in the configuration item of the RDS instance, or if 'monitoringInterval' does not match the rule parameter value."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::RDS::DBInstance"]
    }
    source_owner      = "AWS"
    source_identifier = "RDS_ENHANCED_MONITORING_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  iam_user_no_policies_check = {
    name                        = "iam-user-no-policies-check"
    description                 = "Checks if none of your AWS Identity and Access Management (IAM) users have policies attached. IAM users must inherit permissions from IAM groups or roles. The rule is NON_COMPLIANT if there is at least one IAM user with policies attached."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::IAM::User"]
    }
    source_owner      = "AWS"
    source_identifier = "IAM_USER_NO_POLICIES_CHECK"
    evaluation_mode   = "DETECTIVE"
  }
  redshift_cluster_public_access_check = {
    name                        = "redshift-cluster-public-access-check"
    description                 = "Checks if Amazon Redshift clusters are not publicly accessible. The rule is NON_COMPLIANT if the publiclyAccessible field is True in the cluster configuration item."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::Redshift::Cluster"]
    }
    source_owner      = "AWS"
    source_identifier = "REDSHIFT_CLUSTER_PUBLIC_ACCESS_CHECK"
    evaluation_mode   = "DETECTIVE"
  }
  db_instance_backup_enabled = {
    name                        = "db-instance-backup-enabled"
    description                 = "Checks whether RDS DB instances have backups enabled."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::RDS::DBInstance"]
    }
    source_owner      = "AWS"
    source_identifier = "DB_INSTANCE_BACKUP_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  iam_policy_no_statements_with_full_access = {
    name                        = "iam-policy-no-statements-with-full-access"
    description                 = "Checks if AWS Identity and Access Management (IAM) policies grant permissions to all actions on individual AWS resources. The rule is NON_COMPLIANT if the managed IAM policy allows full access to at least 1 AWS service."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::IAM::Policy"]
    }
    source_owner      = "AWS"
    source_identifier = "IAM_POLICY_NO_STATEMENTS_WITH_FULL_ACCESS"
    evaluation_mode   = "DETECTIVE"
  }
  beanstalk_enhanced_health_reporting_enabled = {
    name                        = "beanstalk-enhanced-health-reporting-enabled"
    description                 = "checks for Elastic Beanstalk environment is configured for 'enhanced' health reporting and NON_COMPLIANT if configured for 'basic' health reporting"
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::ElasticBeanstalk::Environment"]
    }
    source_owner      = "AWS"
    source_identifier = "BEANSTALK_ENHANCED_HEALTH_REPORTING_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  rds_instance_iam_authentication_enabled = {
    name                        = "rds-instance-iam-authentication-enabled"
    description                 = "Checks if an Amazon Relational Database Service (Amazon RDS) instance has AWS Identity and Access Management (IAM) authentication enabled. The rule is NON_COMPLIANT if an Amazon RDS instance does not have IAM authentication enabled."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::RDS::DBInstance"]
    }
    source_owner      = "AWS"
    source_identifier = "RDS_INSTANCE_IAM_AUTHENTICATION_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  multi_region_cloudtrail_enabled = {
    name                        = "multi-region-cloudtrail-enabled"
    description                 = "Checks that there is at least one multi-region AWS CloudTrail. The rule is non-compliant if the trails do not match input parameters"
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = []
    }
    source_owner      = "AWS"
    source_identifier = "MULTI_REGION_CLOUD_TRAIL_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  ecs_task_definition_user_for_host_mode_check = {
    name                        = "ecs-task-definition-user-for-host-mode-check"
    description                 = "Checks if Amazon ECS task definitions with host network mode have 'privileged' or 'user' in the container definition. The rule is NON_COMPLIANT if the latest revision of a task definition has privileged=false or is empty and user=root or is empty."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::ECS::TaskDefinition"]
    }
    source_owner      = "AWS"
    source_identifier = "ECS_TASK_DEFINITION_USER_FOR_HOST_MODE_CHECK"
    evaluation_mode   = "DETECTIVE"
  }
  vpc_vpn_2_tunnels_up = {
    name                        = "vpc-vpn-2-tunnels-up"
    description                 = "Checks if both virtual private network (VPN) tunnels provided by AWS Site-to-Site VPN are in UP status. The rule is NON_COMPLIANT if one or both tunnels are in DOWN status."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::EC2::VPNConnection"]
    }
    source_owner      = "AWS"
    source_identifier = "VPC_VPN_2_TUNNELS_UP"
    evaluation_mode   = "DETECTIVE"
  }
  eip_attached = {
    name                        = "eip-attached"
    description                 = "Checks if all Elastic IP addresses that are allocated to an AWS account are attached to EC2 instances or in-use elastic network interfaces. The rule is NON_COMPLIANT if the 'AssociationId' is null for the Elastic IP address."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::EC2::EIP"]
    }
    source_owner      = "AWS"
    source_identifier = "EIP_ATTACHED"
    evaluation_mode   = "DETECTIVE"
  }
  rds_in_backup_plan = {
    name                        = "rds-in-backup-plan"
    description                 = "Checks if Amazon Relational Database Service (Amazon RDS) databases are present in AWS Backup plans. The rule is NON_COMPLIANT if Amazon RDS databases are not included in any AWS Backup plan."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = ["AWS::RDS::DBInstance"]
    }
    source_owner      = "AWS"
    source_identifier = "RDS_IN_BACKUP_PLAN"
    evaluation_mode   = "DETECTIVE"
  }
  rds_instance_deletion_protection_enabled = {
    name                        = "rds-instance-deletion-protection-enabled"
    description                 = "Checks if an Amazon Relational Database Service (Amazon RDS) instance has deletion protection enabled. The rule is NON_COMPLIANT if an Amazon RDS instance does not have deletion protection enabled; for example, deletionProtection is set to false."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::RDS::DBInstance"]
    }
    source_owner      = "AWS"
    source_identifier = "RDS_INSTANCE_DELETION_PROTECTION_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  lambda_dlq_check = {
    name                        = "lambda-dlq-check"
    description                 = "Checks if a Lambda function is configured with a dead-letter queue. The rule is NON_COMPLIANT if the Lambda function is not configured with a dead-letter queue."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::Lambda::Function"]
    }
    source_owner      = "AWS"
    source_identifier = "LAMBDA_DLQ_CHECK"
    evaluation_mode   = "DETECTIVE"
  }
  cloud_trail_log_file_validation_enabled = {
    name                        = "cloud-trail-log-file-validation-enabled"
    description                 = "Checks if AWS CloudTrail creates a signed digest file with logs. AWS recommends that the file validation must be enabled on all trails. The rule is NON_COMPLIANT if the validation is not enabled."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = ["AWS::CloudTrail::Trail"]
    }
    source_owner      = "AWS"
    source_identifier = "CLOUD_TRAIL_LOG_FILE_VALIDATION_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  restricted_ssh = {
    name                        = "restricted-ssh"
    description                 = "Checks whether security groups that are in use disallow unrestricted incoming SSH traffic."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = ["AWS::EC2::SecurityGroup"]
    }
    source_owner      = "AWS"
    source_identifier = "INCOMING_SSH_DISABLED"
    evaluation_mode   = "DETECTIVE"
  }
  elasticsearch_logs_to_cloudwatch = {
    name                        = "elasticsearch-logs-to-cloudwatch"
    description                 = "Checks if OpenSearch Service (previously called Elasticsearch) domains are configured to send logs to CloudWatch Logs. The rule is COMPLIANT if a log is enabled for an OpenSearch Service domain. The rule is NON_COMPLIANT if logging is not configured."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::Elasticsearch::Domain"]
    }
    source_owner      = "AWS"
    source_identifier = "ELASTICSEARCH_LOGS_TO_CLOUDWATCH"
    evaluation_mode   = "DETECTIVE"
  }
  api_gw_associated_with_waf = {
    name                        = "api-gw-associated-with-waf"
    description                 = "Checks if an Amazon API Gateway API stage is using an AWS WAF web access control list (web ACL). The rule is NON_COMPLIANT if an AWS WAF Web ACL is not used or if a used AWS Web ACL does not match what is listed in the rule parameter."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::ApiGateway::Stage"]
    }
    source_owner      = "AWS"
    source_identifier = "API_GW_ASSOCIATED_WITH_WAF"
    evaluation_mode   = "DETECTIVE"
  }
  dynamodb_autoscaling_enabled = {
    name                        = "dynamodb-autoscaling-enabled"
    description                 = "Checks if Amazon DynamoDB tables or global secondary indexes can process read/write capacity using on-demand mode or provisioned mode with auto scaling enabled. The rule is NON_COMPLIANT if either mode is used without auto scaling enabled"
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = ["AWS::DynamoDB::Table"]
    }
    source_owner      = "AWS"
    source_identifier = "DYNAMODB_AUTOSCALING_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  api_gw_ssl_enabled = {
    name                        = "api-gw-ssl-enabled"
    description                 = "Checks if a REST API stage uses an SSL certificate. The rule is NON_COMPLIANT if the REST API stage does not have an associated SSL certificate."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::ApiGateway::Stage"]
    }
    source_owner      = "AWS"
    source_identifier = "API_GW_SSL_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  cw_loggroup_retention_period_check = {
    name                        = "cw-loggroup-retention-period-check"
    description                 = "Checks if an Amazon CloudWatch LogGroup retention period is set to greater than 365 days or else a specified retention period. The rule is NON_COMPLIANT if the retention period is less than MinRetentionTime, if specified, or else 365 days."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = []
    }
    source_owner      = "AWS"
    source_identifier = "CW_LOGGROUP_RETENTION_PERIOD_CHECK"
    evaluation_mode   = "DETECTIVE"
  }
  codepipeline_region_fanout_check = {
    name                        = "codepipeline-region-fanout-check"
    description                 = "Checks whether each stage in the AWS CodePipeline deploys to more regions than N times the number of regions the pipeline has deployed to in all previous stages, where N is regionFanoutFactor. The first deployment stage can deploy to only one region."
    input_parameters            = "{\"regionFanoutFactor\":\"3\"}"
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::CodePipeline::Pipeline"]
    }
    source_owner      = "AWS"
    source_identifier = "CODEPIPELINE_REGION_FANOUT_CHECK"
    evaluation_mode   = "DETECTIVE"
  }
  emr_master_no_public_ip = {
    name                        = "emr-master-no-public-ip"
    description                 = "Checks if Amazon EMR clusters' master nodes have public IPs. The rule is NON_COMPLIANT if the master node has a public IP."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = ["AWS::EC2::Instance"]
    }
    source_owner      = "AWS"
    source_identifier = "EMR_MASTER_NO_PUBLIC_IP"
    evaluation_mode   = "DETECTIVE"
  }
  acm_certificate_expiration_check = {
    name                        = "acm-certificate-expiration-check"
    description                 = "Checks whether ACM Certificates in your account are marked for expiration within the specified number of days. Certificates provided by ACM are automatically renewed. ACM does not automatically renew certificates that you import."
    input_parameters            = "{\"daysToExpiration\":\"14\"}"
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = ["AWS::ACM::Certificate"]
    }
    source_owner      = "AWS"
    source_identifier = "ACM_CERTIFICATE_EXPIRATION_CHECK"
    evaluation_mode   = "DETECTIVE"
  }
  autoscaling_launch_config_public_ip_disabled = {
    name                        = "autoscaling-launch-config-public-ip-disabled"
    description                 = "Checks if Amazon EC2 Auto Scaling groups have public IP addresses enabled through Launch Configurations. The rule is NON_COMPLIANT if the Launch Configuration for an Amazon EC2 Auto Scaling group has AssociatePublicIpAddress set to 'true'."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::AutoScaling::LaunchConfiguration"]
    }
    source_owner      = "AWS"
    source_identifier = "AUTOSCALING_LAUNCH_CONFIG_PUBLIC_IP_DISABLED"
    evaluation_mode   = "DETECTIVE"
  }
  codepipeline_deployment_count_check = {
    name                        = "codepipeline-deployment-count-check"
    description                 = "Checks if the first deployment stage of AWS CodePipeline performs more than one deployment. Optionally checks if each of the subsequent remaining stages deploy to more than the specified number of deployments (deploymentLimit)."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::CodePipeline::Pipeline"]
    }
    source_owner      = "AWS"
    source_identifier = "CODEPIPELINE_DEPLOYMENT_COUNT_CHECK"
    evaluation_mode   = "DETECTIVE"
  }
  sagemaker_notebook_instance_kms_key_configured = {
    name                        = "sagemaker-notebook-instance-kms-key-configured"
    description                 = "Checks if an AWS Key Management Service (AWS KMS) key is configured for an Amazon SageMaker notebook instance. The rule is NON_COMPLIANT if 'KmsKeyId' is not specified for the SageMaker notebook instance."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = ["AWS::SageMaker::NotebookInstance"]
    }
    source_owner      = "AWS"
    source_identifier = "SAGEMAKER_NOTEBOOK_INSTANCE_KMS_KEY_CONFIGURED"
    evaluation_mode   = "DETECTIVE"
  }
  ec2_instance_detailed_monitoring_enabled = {
    name                        = "ec2-instance-detailed-monitoring-enabled"
    description                 = "Checks whether detailed monitoring is enabled for EC2 instances."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::EC2::Instance"]
    }
    source_owner      = "AWS"
    source_identifier = "EC2_INSTANCE_DETAILED_MONITORING_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  s3_bucket_logging_enabled = {
    name                        = "s3-bucket-logging-enabled"
    description                 = "Checks if logging is enabled for your S3 buckets. The rule is NON_COMPLIANT if logging is not enabled."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::S3::Bucket"]
    }
    source_owner      = "AWS"
    source_identifier = "S3_BUCKET_LOGGING_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  ec2_ebs_encryption_by_default = {
    name                        = "ec2-ebs-encryption-by-default"
    description                 = "Checks if Amazon Elastic Block Store (EBS) encryption is enabled by default. The rule is NON_COMPLIANT if the encryption is not enabled."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = []
    }
    source_owner      = "AWS"
    source_identifier = "EC2_EBS_ENCRYPTION_BY_DEFAULT"
    evaluation_mode   = "DETECTIVE"
  }
  api_gw_execution_logging_enabled = {
    name                        = "api-gw-execution-logging-enabled"
    description                 = "Checks if all methods in Amazon API Gateway stages have logging enabled. The rule is NON_COMPLIANT if logging is not enabled, or if loggingLevel is neither ERROR nor INFO."
    input_parameters            = "{\"loggingLevel\":\"ERROR,INFO\"}"
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::ApiGateway::Stage", "AWS::ApiGatewayV2::Stage"]
    }
    source_owner      = "AWS"
    source_identifier = "API_GW_EXECUTION_LOGGING_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  redshift_require_tls_ssl = {
    name                        = "redshift-require-tls-ssl"
    description                 = "Checks if Amazon Redshift clusters require TLS/SSL encryption to connect to SQL clients. The rule is NON_COMPLIANT if any Amazon Redshift cluster has parameter require_SSL not set to true."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::Redshift::Cluster", "AWS::Redshift::ClusterParameterGroup"]
    }
    source_owner      = "AWS"
    source_identifier = "REDSHIFT_REQUIRE_TLS_SSL"
    evaluation_mode   = "DETECTIVE"
  }
  cloudtrail_s3_dataevents_enabled = {
    name                        = "cloudtrail-s3-dataevents-enabled"
    description                 = "Checks if at least one AWS CloudTrail trail is logging Amazon Simple Storage Service (Amazon S3) data events for all S3 buckets. The rule is NON_COMPLIANT if there are trails or if no trails record S3 data events."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = []
    }
    source_owner      = "AWS"
    source_identifier = "CLOUDTRAIL_S3_DATAEVENTS_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  emr_kerberos_enabled = {
    name                        = "emr-kerberos-enabled"
    description                 = "The rule is NON_COMPLIANT if a security configuration is not attached to the cluster or the security configuration does not satisfy the specified rule parameters."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = []
    }
    source_owner      = "AWS"
    source_identifier = "EMR_KERBEROS_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  aurora_mysql_backtracking_enabled = {
    name                        = "aurora-mysql-backtracking-enabled"
    description                 = "Checks if an Amazon Aurora MySQL cluster has backtracking enabled. The rule is NON_COMPLIANT if the Aurora cluster uses MySQL and it does not have backtracking enabled."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::RDS::DBCluster"]
    }
    source_owner      = "AWS"
    source_identifier = "AURORA_MYSQL_BACKTRACKING_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  iam_no_inline_policy_check = {
    name                        = "iam-no-inline-policy-check"
    description                 = "Checks if the inline policy feature is not in use. The rule is NON_COMPLIANT if an AWS Identity and Access Management (IAM) user, IAM role or IAM group has any inline policy."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::IAM::User", "AWS::IAM::Role", "AWS::IAM::Group"]
    }
    source_owner      = "AWS"
    source_identifier = "IAM_NO_INLINE_POLICY_CHECK"
    evaluation_mode   = "DETECTIVE"
  }
  account_part_of_organizations = {
    name                        = "account-part-of-organizations"
    description                 = "Rule checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if the AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = []
    }
    source_owner      = "AWS"
    source_identifier = "ACCOUNT_PART_OF_ORGANIZATIONS"
    evaluation_mode   = "DETECTIVE"
  }
  iam_policy_no_statements_with_admin_access = {
    name                        = "iam-policy-no-statements-with-admin-access"
    description                 = "Checks whether the default version of AWS Identity and Access Management (IAM) policies do not have administrator access. If any statement has \"Effect\": \"Allow\" with \"Action\": \"*\" over \"Resource\": \"*\", the rule is non-compliant."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::IAM::Policy"]
    }
    source_owner      = "AWS"
    source_identifier = "IAM_POLICY_NO_STATEMENTS_WITH_ADMIN_ACCESS"
    evaluation_mode   = "DETECTIVE"
  }
  elb_logging_enabled = {
    name                        = "elb-logging-enabled"
    description                 = "Checks whether the Application Load Balancers and the Classic Load Balancers have logging enabled."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::ElasticLoadBalancing::LoadBalancer", "AWS::ElasticLoadBalancingV2::LoadBalancer"]
    }
    source_owner      = "AWS"
    source_identifier = "ELB_LOGGING_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  no_unrestricted_route_to_igw = {
    name                        = "no-unrestricted-route-to-igw"
    description                 = "Checks if there are public routes in the route table to an Internet gateway (IGW). The rule is NON_COMPLIANT if a route to an IGW has a destination CIDR block of '0.0.0.0/0' or '::/0' or if a destination CIDR block does not match the rule parameter."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::EC2::RouteTable"]
    }
    source_owner      = "AWS"
    source_identifier = "NO_UNRESTRICTED_ROUTE_TO_IGW"
    evaluation_mode   = "DETECTIVE"
  }
  cloudtrail_enabled = {
    name                        = "cloudtrail-enabled"
    description                 = "Checks if an AWS CloudTrail trail is enabled in your AWS account. The rule is NON_COMPLIANT if a trail is not enabled. Optionally, the rule checks a specific S3 bucket, Amazon Simple Notification Service (Amazon SNS) topic, and CloudWatch log group."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = []
    }
    source_owner      = "AWS"
    source_identifier = "CLOUD_TRAIL_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  dynamodb_throughput_limit_check = {
    name                        = "dynamodb-throughput-limit-check"
    description                 = "Checks whether provisioned DynamoDB throughput is approaching the maximum limit for your account."
    input_parameters            = "{\"accountRCUThresholdPercentage\":\"80\",\"accountWCUThresholdPercentage\":\"80\"}"
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = []
    }
    source_owner      = "AWS"
    source_identifier = "DYNAMODB_THROUGHPUT_LIMIT_CHECK"
    evaluation_mode   = "DETECTIVE"
  }
  elasticache_redis_cluster_automatic_backup_check = {
    name                        = "elasticache-redis-cluster-automatic-backup-check"
    description                 = "The rule is NON_COMPLIANT if SnapshotRetentionLimit for Redis cluster is less than the SnapshotRetentionPeriod parameter, i.e from 0 to 15 as the default is 15."
    input_parameters            = "{\"snapshotRetentionPeriod\":\"15\"}"
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = []
    }
    source_owner      = "AWS"
    source_identifier = "ELASTICACHE_REDIS_CLUSTER_AUTOMATIC_BACKUP_CHECK"
    evaluation_mode   = "DETECTIVE"
  }
  redshift_backup_enabled = {
    name                        = "redshift-backup-enabled"
    description                 = "Checks that Amazon Redshift automated snapshots are enabled for clusters."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::Redshift::Cluster"]
    }
    source_owner      = "AWS"
    source_identifier = "REDSHIFT_BACKUP_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  rds_logging_enabled = {
    name                        = "rds-logging-enabled"
    description                 = "Checks if respective logs of Amazon Relational Database Service (Amazon RDS) are enabled. The rule is NON_COMPLIANT if any log types are not enabled."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::RDS::DBInstance"]
    }
    source_owner      = "AWS"
    source_identifier = "RDS_LOGGING_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  eks_secrets_encrypted = {
    name                        = "eks-secrets-encrypted"
    description                 = "Checks whether Amazon Elastic Kubernetes Service clusters are configured to have Kubernetes secrets encrypted using AWS Key Management Service (KMS) keys. This rule is NON_COMPLIANT if an EKS cluster does not have an encryptionConfig."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = ["AWS::EKS::Cluster"]
    }
    source_owner      = "AWS"
    source_identifier = "EKS_SECRETS_ENCRYPTED"
    evaluation_mode   = "DETECTIVE"
  }
  ec2_instances_in_vpc = {
    name                        = "ec2-instances-in-vpc"
    description                 = "Checks whether your EC2 instances belong to a virtual private cloud (VPC)."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::EC2::Instance"]
    }
    source_owner      = "AWS"
    source_identifier = "INSTANCES_IN_VPC"
    evaluation_mode   = "DETECTIVE"
  }
  cloud_trail_encryption_enabled = {
    name                        = "cloud-trail-encryption-enabled"
    description                 = "Checks whether AWS CloudTrail is configured to use the server side encryption (SSE) AWS Key Management Service (AWS KMS) customer master key (CMK) encryption. The rule is compliant if the KmsKeyId is defined."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = ["AWS::CloudTrail::Trail"]
    }
    source_owner      = "AWS"
    source_identifier = "CLOUD_TRAIL_ENCRYPTION_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  s3_bucket_server_side_encryption_enabled = {
    name                        = "s3-bucket-server-side-encryption-enabled"
    description                 = "Checks if S3 buckets have default encryption enabled or have bucket policies that explicitly deny put-object requests without server side encryption using AES-256 or AWS KMS. The rule is NON_COMPLIANT if an S3 bucket is not encrypted by default."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::S3::Bucket"]
    }
    source_owner      = "AWS"
    source_identifier = "S3_BUCKET_SERVER_SIDE_ENCRYPTION_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  sns_encrypted_kms = {
    name                        = "sns-encrypted-kms"
    description                 = "Checks if an SNS topic is encrypted with AWS Key Management Service (AWS KMS). The rule is NON_COMPLIANT if the SNS topic is not encrypted with AWS KMS or if a KMS key ID used to encrypt the SNS topic is not present in the 'kmsKeyIds' input parameter."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::SNS::Topic"]
    }
    source_owner      = "AWS"
    source_identifier = "SNS_ENCRYPTED_KMS"
    evaluation_mode   = "DETECTIVE"
  }
  rds_snapshots_public_prohibited = {
    name                        = "rds-snapshots-public-prohibited"
    description                 = "Checks if Amazon Relational Database Service (Amazon RDS) snapshots are public. The rule is non-compliant if any existing and new Amazon RDS snapshots are public."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::RDS::DBSnapshot", "AWS::RDS::DBClusterSnapshot"]
    }
    source_owner      = "AWS"
    source_identifier = "RDS_SNAPSHOTS_PUBLIC_PROHIBITED"
    evaluation_mode   = "DETECTIVE"
  }
  lambda_inside_vpc = {
    name                        = "lambda-inside-vpc"
    description                 = "Checks if a Lambda function is allowed access to a virtual private cloud (VPC). The rule is NON_COMPLIANT if the Lambda function is not VPC enabled."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::Lambda::Function"]
    }
    source_owner      = "AWS"
    source_identifier = "LAMBDA_INSIDE_VPC"
    evaluation_mode   = "DETECTIVE"
  }
  iam_user_group_membership_check = {
    name                        = "iam-user-group-membership-check"
    description                 = "Checks whether IAM users are members of at least one IAM group."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::IAM::User"]
    }
    source_owner      = "AWS"
    source_identifier = "IAM_USER_GROUP_MEMBERSHIP_CHECK"
    evaluation_mode   = "DETECTIVE"
  }
  s3_bucket_default_lock_enabled = {
    name                        = "s3-bucket-default-lock-enabled"
    description                 = "Checks if the S3 bucket has lock enabled, by default. The rule is NON_COMPLIANT if the lock is not enabled."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::S3::Bucket"]
    }
    source_owner      = "AWS"
    source_identifier = "S3_BUCKET_DEFAULT_LOCK_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  elbv2_acm_certificate_required = {
    name                        = "elbv2-acm-certificate-required"
    description                 = "Checks if Application Load Balancers and Network Load Balancers are configured to use certificates from Amazon Certificate Manager (ACM). This rule is NON_COMPLIANT if at least 1 load balancer is configured without a certificate from ACM."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = ["AWS::ElasticLoadBalancingV2::LoadBalancer"]
    }
    source_owner      = "AWS"
    source_identifier = "ELBV2_ACM_CERTIFICATE_REQUIRED"
    evaluation_mode   = "DETECTIVE"
  }
  ebs_optimized_instance = {
    name                        = "ebs-optimized-instance"
    description                 = "Checks if Amazon EBS optimization is enabled for your Amazon Elastic Compute Cloud (Amazon EC2) instances that can be Amazon EBS-optimized. The rule is NON_COMPLIANT if EBS optimization is not enabled for an Amazon EC2 instance that can be EBS-optimized."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::EC2::Instance"]
    }
    source_owner      = "AWS"
    source_identifier = "EBS_OPTIMIZED_INSTANCE"
    evaluation_mode   = "DETECTIVE"
  }
  cloud_trail_cloud_watch_logs_enabled = {
    name                        = "cloud-trail-cloud-watch-logs-enabled"
    description                 = "Checks if AWS CloudTrail trails are configured to send logs to CloudWatch logs. The trail is NON_COMPLIANT if the CloudWatchLogsLogGroupArn property of the trail is empty."
    input_parameters            = ""
    maximum_execution_frequency = "TwentyFour_Hours"
    scope = {
      compliance_resource_types = ["AWS::CloudTrail::Trail"]
    }
    source_owner      = "AWS"
    source_identifier = "CLOUD_TRAIL_CLOUD_WATCH_LOGS_ENABLED"
    evaluation_mode   = "DETECTIVE"
  }
  ec2_managedinstance_patch_compliance_status_check = {
    name                        = "ec2-managedinstance-patch-compliance-status-check"
    description                 = "Checks if the compliance status of the AWS Systems Manager patch compliance is COMPLIANT or NON_COMPLIANT after the patch installation on the instance. The rule is compliant if the field status is COMPLIANT."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::SSM::PatchCompliance"]
    }
    source_owner      = "AWS"
    source_identifier = "EC2_MANAGEDINSTANCE_PATCH_COMPLIANCE_STATUS_CHECK"
    evaluation_mode   = "DETECTIVE"
  }
  autoscaling_group_elb_healthcheck_required = {
    name                        = "autoscaling-group-elb-healthcheck-required"
    description                 = "Checks if your Amazon EC2 Auto Scaling groups that are associated with an Elastic Load Balancer use Elastic Load Balancing health checks. The rule is NON_COMPLIANT if the Amazon EC2 Auto Scaling groups are not using Elastic Load Balancing health checks."
    input_parameters            = ""
    maximum_execution_frequency = ""
    scope = {
      compliance_resource_types = ["AWS::AutoScaling::AutoScalingGroup"]
    }
    source_owner      = "AWS"
    source_identifier = "AUTOSCALING_GROUP_ELB_HEALTHCHECK_REQUIRED"
    evaluation_mode   = "DETECTIVE"
  }
}