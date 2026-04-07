variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
}

variable "owner_id" {
  type        = string
  description = "Canonical user ID of the bucket owner"
}

variable "policy_principals" {
  type        = list(string)
  description = "List of AWS principal ARNs allowed to access the bucket"
}