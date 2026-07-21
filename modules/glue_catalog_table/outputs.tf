output "id" {
  description = "The ID of the Glue catalog table"
  value       = aws_glue_catalog_table.this.id
}

output "arn" {
  description = "The ARN of the Glue catalog table"
  value       = aws_glue_catalog_table.this.arn
}
