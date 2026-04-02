variable "region" {
  type        = string
  description = "AWS region for resource deployment"
}

variable "cloudformation_template" {
  type        = string
  description = "CloudFormation template body (JSON or YAML)"
}