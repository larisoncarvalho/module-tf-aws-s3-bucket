variable "region" {
  description = "AWS REGION WHERE RESOURCES WILL BE MANAGED"
  type        = string
}

variable "bucket" {
  description = "NAME OF THE S3 BUCKET"
  type        = string
}

variable "acl_grant_owner_id" {
  description = "CANONICAL USER ID OF THE BUCKET OWNER GRANTED FULL_CONTROL"
  type        = string
}

variable "acl_grant_secondary_id" {
  description = "CANONICAL USER ID OF THE SECONDARY GRANTEE WITH FULL_CONTROL"
  type        = string
}

variable "bucket_policy" {
  description = "JSON BUCKET POLICY DOCUMENT GRANTING S3:* TO SPECIFIED AWS PRINCIPALS"
  type        = string
}