# orchestrator-resources-qa-s3
module "s3_bucket" {
  source = "./modules/s3_bucket"

  bucket                 = var.bucket
  acl_grant_owner_id     = var.acl_grant_owner_id
  acl_grant_secondary_id = var.acl_grant_secondary_id
  bucket_policy          = var.bucket_policy
}