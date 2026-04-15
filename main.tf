module "s3" {
  source = "./modules/vpc_endpoint"

  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.eu-central-1.s3"
  vpc_endpoint_type   = "Gateway"
  route_table_ids     = var.route_table_ids
  private_dns_enabled = false
  policy = jsonencode({
    Version = "2008-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = "*"
      Action    = "*"
      Resource  = "*"
    }]
  })
  tags = {
    Name          = "s3"
    Resource-Type = "prod"
  }
}