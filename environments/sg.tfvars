region = "us-east-1"

iam_roles = {
  stulyze_sms = {
    name                  = "stulyze-sms"
    path                  = "/service-role/"
    assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"StringEquals\":{\"sts:ExternalId\":\"f09e5751-899c-4a07-a657-1b160c7d6b1d\"}},\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"cognito-idp.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
    max_session_duration  = 3600
    force_detach_policies = false
    managed_policy_arns   = ["arn:aws:iam::714114208215:policy/service-role/Cognito-1690255817691"]
    inline_policy         = []
  }
  stulyze_django_dev_zappa_lambda_execution_role = {
    name                  = "stulyze-django-dev-ZappaLambdaExecutionRole"
    path                  = "/"
    assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"apigateway.amazonaws.com\",\"lambda.amazonaws.com\",\"events.amazonaws.com\"]}}],\"Version\":\"2012-10-17\"}"
    max_session_duration  = 3600
    force_detach_policies = false
    managed_policy_arns   = []
    inline_policy = [
      {
        name   = "zappa-permissions"
        policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"logs:*\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:logs:*:*:*\"},{\"Action\":[\"lambda:InvokeFunction\"],\"Effect\":\"Allow\",\"Resource\":[\"*\"]},{\"Action\":[\"xray:PutTraceSegments\",\"xray:PutTelemetryRecords\"],\"Effect\":\"Allow\",\"Resource\":[\"*\"]},{\"Action\":[\"ec2:AttachNetworkInterface\",\"ec2:CreateNetworkInterface\",\"ec2:DeleteNetworkInterface\",\"ec2:DescribeInstances\",\"ec2:DescribeNetworkInterfaces\",\"ec2:DetachNetworkInterface\",\"ec2:ModifyNetworkInterfaceAttribute\",\"ec2:ResetNetworkInterfaceAttribute\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"s3:*\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:s3:::*\"},{\"Action\":[\"kinesis:*\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:kinesis:*:*:*\"},{\"Action\":[\"sns:*\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:sns:*:*:*\"},{\"Action\":[\"sqs:*\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:sqs:*:*:*\"},{\"Action\":[\"dynamodb:*\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:dynamodb:*:*:*\"},{\"Action\":[\"route53:*\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
      }
    ]
  }
}