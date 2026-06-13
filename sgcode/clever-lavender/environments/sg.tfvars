region              = "eu-central-1"
bucket              = "stackguardian-cosmic-penguin"
force_destroy       = true
object_lock_enabled = false
tags = {
  CreatedBy   = "StackGuardian"
  Description = "Demo Bucket for hosting the static website"
  Name        = "aws_s3_bucket.s3_bucket.id"
}