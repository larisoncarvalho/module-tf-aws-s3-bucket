module "vpc" {
  source = "./modules/vpc"

  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "vpc_name"
  }
}

module "subnets" {
  source = "./modules/subnet"

  vpc_id = module.vpc.vpc_id
  subnets = {
    vpc_name_private_eu_central_1b = {
      cidr_block              = "10.0.101.0/24"
      availability_zone       = "eu-central-1b"
      map_public_ip_on_launch = false
      tags = {
        Name = "vpc_name-private-eu-central-1b"
      }
    }
    vpc_name_public_eu_central_1b = {
      cidr_block              = "10.0.1.0/24"
      availability_zone       = "eu-central-1b"
      map_public_ip_on_launch = true
      tags = {
        Name = "vpc_name-public-eu-central-1b"
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
    vpc_name_public_eu_central_1a = {
      cidr_block              = "10.0.0.0/24"
      availability_zone       = "eu-central-1a"
      map_public_ip_on_launch = true
      tags = {
        Name = "vpc_name-public-eu-central-1a"
      }
    }
  }
}

module "internet_gateway" {
  source = "./modules/internet_gateway"

  vpc_id = module.vpc.vpc_id
  tags = {
    Name = "vpc_name"
  }
}

module "route_tables" {
  source = "./modules/route_table"

  vpc_id = module.vpc.vpc_id
  route_tables = {
    vpc_name_public = {
      tags = {
        Name = "vpc_name-public"
      }
    }
    vpc_name_private_eu_central_1b = {
      tags = {
        Name = "vpc_name-private-eu-central-1b"
      }
    }
    vpc_name_private_eu_central_1a = {
      tags = {
        Name = "vpc_name-private-eu-central-1a"
      }
    }
    vpc_name_default = {
      tags = {
        Name = "vpc_name-default"
      }
    }
  }
  routes = {
    public_internet = {
      route_table_key        = "vpc_name_public"
      destination_cidr_block = "0.0.0.0/0"
      gateway_id             = module.internet_gateway.internet_gateway_id
    }
  }
  route_table_associations = {
    public_1a = {
      route_table_key = "vpc_name_public"
      subnet_id       = module.subnets.subnet_ids["vpc_name_public_eu_central_1a"]
    }
    public_1b = {
      route_table_key = "vpc_name_public"
      subnet_id       = module.subnets.subnet_ids["vpc_name_public_eu_central_1b"]
    }
    private_1a = {
      route_table_key = "vpc_name_private_eu_central_1a"
      subnet_id       = module.subnets.subnet_ids["vpc_name_private_eu_central_1a"]
    }
    private_1b = {
      route_table_key = "vpc_name_private_eu_central_1b"
      subnet_id       = module.subnets.subnet_ids["vpc_name_private_eu_central_1b"]
    }
  }
}

module "default_security_group" {
  source = "./modules/security_group"

  group_name  = "default"
  description = "default VPC security group"
  vpc_id      = module.vpc.vpc_id
  tags = {
    Name = "vpc_name-default"
  }
}

module "default_network_acl" {
  source = "./modules/network_acl"

  default_network_acl_id = var.default_network_acl_id
  subnet_ids = [
    module.subnets.subnet_ids["vpc_name_public_eu_central_1b"],
    module.subnets.subnet_ids["vpc_name_private_eu_central_1a"],
    module.subnets.subnet_ids["vpc_name_public_eu_central_1a"],
    module.subnets.subnet_ids["vpc_name_private_eu_central_1b"]
  ]
  ingress_rules = [
    {
      protocol   = "-1"
      rule_no    = 100
      action     = "allow"
      cidr_block = "0.0.0.0/0"
      from_port  = 0
      to_port    = 0
    }
  ]
  egress_rules = [
    {
      protocol   = "-1"
      rule_no    = 100
      action     = "allow"
      cidr_block = "0.0.0.0/0"
      from_port  = 0
      to_port    = 0
    }
  ]
}