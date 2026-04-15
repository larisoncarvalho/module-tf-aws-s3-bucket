module "primary_workgroup" {
  source = "./modules/athena_workgroup"

  workgroup_name                     = "dev-manuel-meireles-primary-workgroup"
  description                        = "Primary Athena workgroup for dev-manuel-meireles"
  state                              = "ENABLED"
  bytes_scanned_cutoff_per_query     = 107374182
  enforce_workgroup_configuration    = false
  publish_cloudwatch_metrics_enabled = true
  requester_pays_enabled             = false
  output_location                    = "s3://dev-manuel-meireles-infra-athena-results/query-results/"
  encryption_option                  = "SSE_S3"
  selected_engine_version            = "AUTO"
}