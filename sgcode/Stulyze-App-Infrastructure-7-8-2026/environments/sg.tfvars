# VPC
vpc_cidr_block           = "172.31.0.0/16"
vpc_instance_tenancy     = "default"
vpc_enable_dns_support   = true
vpc_enable_dns_hostnames = true

# Subnets
subnets = {
  aws_subnet_1 = {
    cidr_block              = "172.31.16.0/20"
    availability_zone       = "ap-southeast-1b"
    map_public_ip_on_launch = true
  }
  aws_subnet_2 = {
    cidr_block              = "172.31.0.0/20"
    availability_zone       = "ap-southeast-1c"
    map_public_ip_on_launch = true
  }
  aws_subnet_3 = {
    cidr_block              = "172.31.32.0/20"
    availability_zone       = "ap-southeast-1a"
    map_public_ip_on_launch = true
  }
}

# Security Groups
security_groups = {
  default = {
    name        = "default"
    description = "default VPC security group"
    ingress = [
      {
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        self      = true
      }
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
}

# Route Table
route_table_routes = [
  {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-02aec4b4978ee2879"
  }
]

# Network ACL
network_acl_default_network_acl_id = "acl-0b1b4715940488f98"

network_acl_subnet_ids = [
  "subnet-0aec9ccc3d679b626",
  "subnet-0aee82bad124320d3",
  "subnet-0df3e594471580676"
]

network_acl_ingress = [
  {
    rule_no    = 100
    action     = "allow"
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
]

network_acl_egress = [
  {
    rule_no    = 100
    action     = "allow"
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
]

# Athena Workgroup
athena_workgroup_name                               = "primary"
athena_workgroup_state                              = "ENABLED"
athena_workgroup_enforce_workgroup_configuration    = false
athena_workgroup_publish_cloudwatch_metrics_enabled = true
athena_workgroup_requester_pays_enabled             = false
athena_workgroup_selected_engine_version            = "AUTO"

# CloudFormation Stack
cloudformation_stack_name             = "stulyze-app"
cloudformation_stack_disable_rollback = false
