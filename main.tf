module "pa_test_public_subnet" {
  source = "./modules/subnet"

  vpc_id                           = var.vpc_id
  cidr_block                       = "10.0.2.0/24"
  availability_zone                = "eu-central-1b"
  map_public_ip_on_launch          = true
  assign_ipv6_address_on_creation  = false
  tags = {
    Name = "PA-TEst-public-eu-central-1b"
  }
}