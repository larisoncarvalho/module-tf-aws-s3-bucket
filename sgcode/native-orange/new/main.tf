module "vpc" {
  source = "./modules/vpc"

  cidr_block       = "10.0.0.0/24"
  instance_tenancy = "default"
  tags = {
    Name          = "sg-nonprod-1"
    Resource-Type = "nonprod"
  }
}

module "subnet" {
  source = "./modules/subnet"

  assign_ipv6_address_on_creation = false
  availability_zone               = "eu-central-1a"
  cidr_block                      = "10.0.0.32/27"
  ipv6_cidr_block                 = "2a05:d014:190:c620::/64"
  map_public_ip_on_launch         = false
  vpc_id                          = module.vpc.vpc_id
  tags = {
    Name          = "app-a"
    Resource-Type = "nonprod"
  }
}

module "security_group" {
  source = "./modules/security_group"

  description = "restrict all internet access"
  name        = "private-runner"
  vpc_id      = module.vpc.vpc_id
  ingress_rules = {
    ssh_1 = {
      from_port   = 22
      to_port     = 22
      ip_protocol = "tcp"
      cidr_ipv4   = "10.0.0.0/27"
    }
    ssh_2 = {
      from_port   = 22
      to_port     = 22
      ip_protocol = "tcp"
      cidr_ipv4   = "172.16.0.0/24"
    }
    ssh_3 = {
      from_port   = 22
      to_port     = 22
      ip_protocol = "tcp"
      cidr_ipv4   = "115.96.62.109/32"
    }
  }
  egress_rules = {
    all_ipv4 = {
      ip_protocol = "-1"
      cidr_ipv4   = "10.0.0.0/24"
      cidr_ipv6   = null
    }
    all_ipv6 = {
      ip_protocol = "-1"
      cidr_ipv4   = null
      cidr_ipv6   = "::/0"
    }
  }
}

module "key_pair" {
  source = "./modules/key_pair"

  key_name   = "taher-private-runner"
  public_key = var.key_pair_public_key
}

module "instance" {
  source = "./modules/instance"

  ami                                    = "ami-03074cc1b166e8691"
  availability_zone                      = "eu-central-1a"
  capacity_reservation_preference        = "open"
  cpu_core_count                         = 2
  cpu_threads_per_core                   = 1
  ebs_optimized                          = false
  enclave_enabled                        = false
  hibernation                            = false
  instance_type                          = "t2.medium"
  key_name                               = module.key_pair.key_name
  metadata_http_endpoint                 = "enabled"
  metadata_http_protocol_ipv6            = "disabled"
  metadata_http_put_response_hop_limit   = 2
  metadata_http_tokens                   = "required"
  metadata_instance_metadata_tags        = "disabled"
  monitoring                             = false
  private_ip                             = "10.0.0.37"
  root_volume_delete_on_termination      = true
  root_volume_encrypted                  = false
  root_volume_iops                       = 3000
  root_volume_size                       = 8
  root_volume_throughput                 = 125
  root_volume_type                       = "gp3"
  source_dest_check                      = true
  subnet_id                              = module.subnet.subnet_id
  tenancy                                = "default"
  vpc_security_group_ids                 = [module.security_group.security_group_id]
}