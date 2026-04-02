module "private_runner_storage" {
  source = "./modules/s3_bucket"

  bucket_name = "9ghvs69l-private-runner-storage-backend"
}