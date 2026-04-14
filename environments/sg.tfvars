region                        = "us-east-1"
iam_role_name                 = "stulyze-sms"
iam_role_path                 = "/service-role/"
iam_role_max_session_duration = 3600
iam_role_assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"cognito-idp.amazonaws.com\"},\"Action\":\"sts:AssumeRole\",\"Condition\":{\"StringEquals\":{\"sts:ExternalId\":\"f09e5751-899c-4a07-a657-1b160c7d6b1d\"}}}]}"

iam_role_attached_policy_arns = {
  cognito_1690255817691 = {
    arn = "arn:aws:iam::714114208215:policy/service-role/Cognito-1690255817691"
  }
}