output "bucket_id" {
  description = "THE NAME OF THE S3 BUCKET"
  value       = aws_s3_bucket.this.id
}

output "bucket_arn" {
  description = "THE ARN OF THE S3 BUCKET"
  value       = aws_s3_bucket.this.arn
}