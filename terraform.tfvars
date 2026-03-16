region = "eu-central-1"

route_table_vpc_name_private_eu_central_1a = {
  vpc_id = "vpc-024344e8549773d40"
  tags = {
    Name = "vpc_name-private-eu-central-1a"
  }
  routes = {
    s3_endpoint = {
      destination_prefix_list_id = "pl-6ea54007"
      gateway_id                 = "vpce-0ce58ab1c0c1e1ac9"
    }
  }
  associations = {
    private_1a = {
      subnet_id = "subnet-0bb6693f2b6859278"
    }
  }
}