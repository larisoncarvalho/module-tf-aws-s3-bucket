module "backend_storage" {
  source = "./modules/s3_bucket"

  bucket_name = "9ghvs69l-private-runner-storage-backend"
}