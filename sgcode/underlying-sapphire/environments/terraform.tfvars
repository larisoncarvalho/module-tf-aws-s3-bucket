region = "eu-central-1"

name               = "vpc_name"
cidr_block         = "10.0.0.0/16"
instance_tenancy   = "default"
main_route_table_key = "default"

subnets = {
  "public-eu-central-1a" = {
    cidr_block              = "10.0.0.0/24"
    availability_zone       = "eu-central-1a"
    map_public_ip_on_launch = true
  }
  "public-eu-central-1b" = {
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "eu-central-1b"
    map_public_ip_on_launch = true
  }
  "private-eu-central-1a" = {
    cidr_block              = "10.0.100.0/24"
    availability_zone       = "eu-central-1a"
    map_public_ip_on_launch = false
  }
  "private-eu-central-1b" = {
    cidr_block              = "10.0.101.0/24"
    availability_zone       = "eu-central-1b"
    map_public_ip_on_launch = false
  }
}

route_tables = {
  "public" = {}
  "private-eu-central-1a" = {}
  "private-eu-central-1b" = {}
  "default" = {}
}

routes = {
  "public-igw" = {
    route_table_key         = "public"
    destination_cidr_block  = "0.0.0.0/0"
    gateway_id              = "igw"
  }
}

route_table_associations = {
  "public-eu-central-1a" = {
    subnet_key      = "public-eu-central-1a"
    route_table_key = "public"
  }
  "public-eu-central-1b" = {
    subnet_key      = "public-eu-central-1b"
    route_table_key = "public"
  }
  "private-eu-central-1a" = {
    subnet_key      = "private-eu-central-1a"
    route_table_key = "private-eu-central-1a"
  }
  "private-eu-central-1b" = {
    subnet_key      = "private-eu-central-1b"
    route_table_key = "private-eu-central-1b"
  }
}