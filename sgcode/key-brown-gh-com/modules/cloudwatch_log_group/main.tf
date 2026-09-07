resource "aws_cloudwatch_log_group" "this" {
  name                       = var.name
  log_group_class            = var.log_group_class
  retention_in_days          = var.retention_in_days
  deletion_protection_enabled = var.deletion_protection_enabled
  skip_destroy               = var.skip_destroy
  region                     = var.region
}