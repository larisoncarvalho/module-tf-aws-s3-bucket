module "cloudwatch_log_group" {
  source = "./modules/cloudwatch_log_group"

  name                        = var.log_group_name
  log_group_class             = var.log_group_class
  retention_in_days           = var.retention_in_days
  deletion_protection_enabled = var.deletion_protection_enabled
  skip_destroy                = var.skip_destroy
  region                      = var.region
}