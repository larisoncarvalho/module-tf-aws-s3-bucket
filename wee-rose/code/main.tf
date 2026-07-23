module "user_data" {
  source = "./modules/subnet"

  vpc_id                           = var.vpc_id
  cidr_block                       = "10.0.0.128/27"
  availability_zone                = "eu-central-1a"
  assign_ipv6_address_on_creation  = false
  ipv6_cidr_block                  = "2a05:d014:190:c680::/64"
  map_public_ip_on_launch          = false
  tags = {
    Name          = "user-data"
    Resource-Type = "nonprod"
  }
}