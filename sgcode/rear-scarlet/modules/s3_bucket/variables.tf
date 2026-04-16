variable "bucket" {
  type        = string
  description = "Name of the S3 bucket"
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to the bucket"
}

variable "versioning_status" {
  type        = string
  description = "Versioning state of the bucket (Enabled or Suspended)"
}

variable "versioning_mfa_delete" {
  type        = string
  description = "MFA delete state for the bucket (Enabled or Disabled)"
}

variable "sse_algorithm" {
  type        = string
  description = "Server-side encryption algorithm (AES256 or aws:kms)"
}

variable "bucket_key_enabled" {
  type        = bool
  description = "Whether to use Amazon S3 Bucket Keys for SSE-KMS"
}

variable "block_public_acls" {
  type        = bool
  description = "Whether to block public ACLs for the bucket"
}

variable "block_public_policy" {
  type        = bool
  description = "Whether to block public bucket policies"
}

variable "ignore_public_acls" {
  type        = bool
  description = "Whether to ignore public ACLs for the bucket"
}

variable "restrict_public_buckets" {
  type        = bool
  description = "Whether to restrict public bucket policies"
}

variable "acl_grantee_id" {
  type        = string
  description = "Canonical user ID of the ACL grantee"
}

variable "acl_grantee_type" {
  type        = string
  description = "Type of the ACL grantee (CanonicalUser or Group)"
}

variable "acl_permission" {
  type        = string
  description = "Permission granted to the grantee"
}

variable "acl_owner_id" {
  type        = string
  description = "Canonical user ID of the bucket owner"
}