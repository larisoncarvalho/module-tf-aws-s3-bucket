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

variable "block_public_acls" {
  description = "WHETHER AMAZON S3 SHOULD BLOCK PUBLIC ACLS FOR THIS BUCKET"
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = "WHETHER AMAZON S3 SHOULD BLOCK PUBLIC BUCKET POLICIES FOR THIS BUCKET"
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = "WHETHER AMAZON S3 SHOULD IGNORE PUBLIC ACLS FOR THIS BUCKET"
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = "WHETHER AMAZON S3 SHOULD RESTRICT PUBLIC BUCKET POLICIES FOR THIS BUCKET"
  type        = bool
  default     = true
}