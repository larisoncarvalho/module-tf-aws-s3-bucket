module "primary_workgroup" {
  source = "./modules/athena_workgroup"

  workgroup_name                     = "de-manuel-meireles-primary-workgroup"
  description                        = "Primary Athena workgroup for de-manuel-meireles"
  state                              = "ENABLED"
  bytes_scanned_cutoff_per_query     = 10737418240
  enforce_workgroup_configuration    = true
  publish_cloudwatch_metrics_enabled = true
  requester_pays_enabled             = false
  output_location                    = "s3://de-manuel-meireles-infra-athena-results/query-results/"
  encryption_option                  = "SSE_S3"
  selected_engine_version            = "AUTO"
  tags = {
    Architecture = "medallion"
    Environment  = "de-manuel-meireles"
    ManagedBy    = "terraform"
    Project      = "data-lake"
  }
}