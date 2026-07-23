region = "eu-central-1"

subnets = {
  vpc_name_public_eu_central_1b = {
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "eu-central-1b"
    map_public_ip_on_launch = true
    tags = {
      Name = "vpc_name-public-eu-central-1b"
    }
  }
  vpc_name_private_eu_central_1b = {
    cidr_block              = "10.0.101.0/24"
    availability_zone       = "eu-central-1b"
    map_public_ip_on_launch = false
    tags = {
      Name = "vpc_name-private-eu-central-1b"
    }
  }
  vpc_name_public_eu_central_1a = {
    cidr_block              = "10.0.0.0/24"
    availability_zone       = "eu-central-1a"
    map_public_ip_on_launch = true
    tags = {
      Name = "vpc_name-public-eu-central-1a"
    }
  }
  vpc_name_private_eu_central_1a = {
    cidr_block              = "10.0.100.0/24"
    availability_zone       = "eu-central-1a"
    map_public_ip_on_launch = false
    tags = {
      Name = "vpc_name-private-eu-central-1a"
    }
  }
  adis_private_subnet = {
    cidr_block              = "10.0.16.0/20"
    availability_zone       = "eu-central-1c"
    map_public_ip_on_launch = false
    tags = {
      Name = "adis-private-subnet"
    }
  }
}

route_tables = {
  vpc_name_private_eu_central_1a = {
    tags = {
      Name = "vpc_name-private-eu-central-1a"
    }
  }
  vpc_name_private_eu_central_1b = {
    tags = {
      Name = "vpc_name-private-eu-central-1b"
    }
  }
  vpc_name_default = {
    tags = {
      Name = "vpc_name-default"
    }
  }
  vpc_name_public = {
    tags = {
      Name = "vpc_name-public"
    }
  }
}

routes = {
  public_default_route = {
    route_table_key            = "vpc_name_public"
    destination_cidr_block     = "0.0.0.0/0"
    gateway_id                 = "igw-0c442636851158d70"
    destination_prefix_list_id = null
  }
  public_s3_route = {
    route_table_key            = "vpc_name_public"
    destination_cidr_block     = null
    gateway_id                 = null
    destination_prefix_list_id = "pl-6ea54007"
  }
  private_1a_s3_route = {
    route_table_key            = "vpc_name_private_eu_central_1a"
    destination_cidr_block     = null
    gateway_id                 = null
    destination_prefix_list_id = "pl-6ea54007"
  }
  private_1b_s3_route = {
    route_table_key            = "vpc_name_private_eu_central_1b"
    destination_cidr_block     = null
    gateway_id                 = null
    destination_prefix_list_id = "pl-6ea54007"
  }
  default_s3_route = {
    route_table_key            = "vpc_name_default"
    destination_cidr_block     = null
    gateway_id                 = null
    destination_prefix_list_id = "pl-6ea54007"
  }
}

route_table_associations = {
  private_1a = {
    route_table_key = "vpc_name_private_eu_central_1a"
    subnet_id       = "subnet-0bb6693f2b6859278"
  }
  private_1b = {
    route_table_key = "vpc_name_private_eu_central_1b"
    subnet_id       = "subnet-0b56e5172838f1d91"
  }
  public_1a = {
    route_table_key = "vpc_name_public"
    subnet_id       = "subnet-0b77c0d76befaf70d"
  }
  public_1b = {
    route_table_key = "vpc_name_public"
    subnet_id       = "subnet-06bd2a7462c923d6e"
  }
}

dhcp_options_id = "dopt-2dc05147"

security_groups = {}

ingress_rules = {}

egress_rules = {}

network_acl_subnet_ids = [
  "subnet-0b56e5172838f1d91",
  "subnet-0f0fa8613f4ba368b",
  "subnet-06bd2a7462c923d6e",
  "subnet-0bb6693f2b6859278",
  "subnet-0b77c0d76befaf70d"
]

acl_rules = {
  egress_100 = {
    rule_number = 100
    egress      = true
    protocol    = "-1"
    rule_action = "allow"
    cidr_block  = "0.0.0.0/0"
  }
  egress_32767 = {
    rule_number = 32767
    egress      = true
    protocol    = "-1"
    rule_action = "deny"
    cidr_block  = "0.0.0.0/0"
  }
  ingress_100 = {
    rule_number = 100
    egress      = false
    protocol    = "-1"
    rule_action = "allow"
    cidr_block  = "0.0.0.0/0"
  }
  ingress_32767 = {
    rule_number = 32767
    egress      = false
    protocol    = "-1"
    rule_action = "deny"
    cidr_block  = "0.0.0.0/0"
  }
}

vpc_endpoints = {}

instances = {}

efs_file_system_id = "fs-01861c3cb7d96f3c9"

efs_mount_targets = {
  fsmt_03c217036ea9d40a6 = {
    subnet_id = "subnet-0b77c0d76befaf70d"
    security_groups = [
      "sg-04ca1b42ad0b5fbc6"
    ]
    ip_address = "10.0.0.187"
  }
  fsmt_0e66438447f9e02da = {
    subnet_id = "subnet-06bd2a7462c923d6e"
    security_groups = [
      "sg-04ca1b42ad0b5fbc6"
    ]
    ip_address = "10.0.1.242"
  }
}