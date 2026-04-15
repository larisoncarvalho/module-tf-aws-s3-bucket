module "backend_storage" {
  source = "./modules/s3_bucket"

  bucket_name = "7ungwu6v-private-runner-storage-backend"
}