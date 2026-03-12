region = "eu-central-1"

do_not_delete_vpc = {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = null
  enable_dns_support   = null
  tags = {
    Name = "do_not_delete"
  }
}

subnets = {
  privatesubnetname2 = {
    cidr_block              = "10.0.120.0/24"
    availability_zone       = "eu-central-1b"
    map_public_ip_on_launch = false
    tags = {
      Name = "privatesubnetname2"
    }
  }
}

do_not_delete_igw = {
  tags = {
    Name = "do_not_delete"
  }
}

do_not_delete_private_route_table = {
  routes = {}
  subnet_associations = {
    subnet_1 = {
      subnet_id = "subnet-0e4b2d1e5907c198e"
    }
  }
  tags = {
    Name = "do_not_delete-private-eu-central-1a"
  }
}

default_security_group = {
  name        = "default"
  description = "default VPC security group"
  tags = {
    Name = "do_not_delete-default"
  }
}

do_not_delete_default_nacl = {
  subnet_ids = [
    "subnet-0fedab5812fadb197",
    "subnet-0e4b2d1e5907c198e",
    "subnet-03a230a9d1b8b9036",
    "subnet-0587478b1e052ce6a"
  ]
  acl_rules = {
    egress_100 = {
      rule_number     = 100
      egress          = true
      protocol        = "-1"
      rule_action     = "allow"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = null
    }
    egress_101 = {
      rule_number     = 101
      egress          = true
      protocol        = "-1"
      rule_action     = "allow"
      cidr_block      = null
      ipv6_cidr_block = "::/0"
    }
    egress_32767 = {
      rule_number     = 32767
      egress          = true
      protocol        = "-1"
      rule_action     = "deny"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = null
    }
    ingress_100 = {
      rule_number     = 100
      egress          = false
      protocol        = "-1"
      rule_action     = "allow"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = null
    }
    ingress_101 = {
      rule_number     = 101
      egress          = false
      protocol        = "-1"
      rule_action     = "allow"
      cidr_block      = null
      ipv6_cidr_block = "::/0"
    }
    ingress_32767 = {
      rule_number     = 32767
      egress          = false
      protocol        = "-1"
      rule_action     = "deny"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = null
    }
  }
  tags = {
    Name = "do_not_delete-default"
  }
}