output "stulyze_sms_arn" {
  description = "ARN of the stulyze-sms IAM role"
  value       = module.iam_role["stulyze_sms"].arn
}

output "stulyze_sms_unique_id" {
  description = "Unique ID of the stulyze-sms IAM role"
  value       = module.iam_role["stulyze_sms"].unique_id
}

output "stulyze_django_dev_zappa_lambda_execution_role_arn" {
  description = "ARN of the stulyze-django-dev-ZappaLambdaExecutionRole IAM role"
  value       = module.iam_role["stulyze_django_dev_zappa_lambda_execution_role"].arn
}

output "stulyze_django_dev_zappa_lambda_execution_role_unique_id" {
  description = "Unique ID of the stulyze-django-dev-ZappaLambdaExecutionRole IAM role"
  value       = module.iam_role["stulyze_django_dev_zappa_lambda_execution_role"].unique_id
}