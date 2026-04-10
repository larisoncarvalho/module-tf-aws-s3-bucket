module "athena_workgroup" {
  source = "./modules/athena_workgroup"

  name                               = "non-prod-primary-workgroup"
  description                        = "Primary Athena workgroup for non-prod"
  state                              = "ENABLED"
  bytes_scanned_cutoff_per_query     = 1073741824
  enforce_workgroup_configuration    = true
  publish_cloudwatch_metrics_enabled = true
  requester_pays_enabled             = false
  selected_engine_version            = "AUTO"
  output_location                    = "s3://non-prod-infra-athena-results/query-results/"
  encryption_option                  = "SSE_S3"
  tags = {
    Architecture  = "medallion"
    CostCenter    = "non-prod-data-lake"
    DataRetention = "short-term"
    Environment   = "non-prod"
    ManagedBy     = "terraform"
    Project       = "data-lake"
  }
}