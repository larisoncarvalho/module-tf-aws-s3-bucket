module "vpc_name" {
  source = "./modules/internet_gateway"

  vpc_id = var.vpc_id
  tags = {
    Name = "vpc_name"
  }
}