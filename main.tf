module "vpc_02_private_eu_central_1b" {
  source = "./modules/subnet"

  assign_ipv6_address_on_creation                = false
  availability_zone                              = "eu-central-1b"
  cidr_block                                     = "10.0.120.0/24"
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  private_dns_hostname_type_on_launch            = "ip-name"
  vpc_id                                         = "vpc-01a8cd328684b0618"

  tags = {
    Name = "vpc-02-private-eu-central-1b"
  }
}