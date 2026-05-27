module "project_iam_policy" {
  source      = "./modules/project_iam_policy"
  project     = var.project
  policy_data = var.policy_data
}

module "project_iam_audit_config" {
  source                      = "./modules/project_iam_audit_config"
  project                     = var.project
  service                     = var.audit_config_service
  audit_log_config_admin_read = var.audit_log_config_admin_read
  audit_log_config_data_read  = var.audit_log_config_data_read
  audit_log_config_data_write = var.audit_log_config_data_write
}

module "project_organization_policy" {
  source     = "./modules/project_organization_policy"
  project    = var.project
  constraint = var.org_policy_constraint
}

module "service_account_key" {
  source               = "./modules/service_account_key"
  for_each             = var.service_account_keys
  service_account_keys = var.service_account_keys
}