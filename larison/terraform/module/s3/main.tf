module "private_runner_storage_backend" {
  source = "./modules/s3_bucket"

  bucket_name = "7ungwu6v-private-runner-storage-backend"
}