module "instance" {
  source = "./modules/instance"

  ami_id                                  = "ami-03250b0e01c28d196"
  availability_zone                       = "eu-central-1a"
  ebs_optimized                           = false
  instance_name                           = "taher-private-runner-ubuntu"
  instance_type                           = "t2.medium"
  key_name                                = "taher-private-runner"
  metadata_http_endpoint                  = "enabled"
  metadata_http_put_response_hop_limit    = 2
  metadata_http_tokens                    = "required"
  monitoring                              = false
  public_key                              = var.key_pair_public_key
  root_volume_delete_on_termination       = true
  root_volume_encrypted                   = false
  root_volume_iops                        = 3000
  root_volume_size                        = 32
  root_volume_throughput                  = 125
  root_volume_type                        = "gp3"
  security_group_description              = "launch-wizard-4 created 2023-07-26T08:33:45.187Z"
  security_group_name                     = "launch-wizard-4"
  source_dest_check                       = true
  subnet_assign_ipv6_address_on_creation  = false
  subnet_cidr_block                       = "10.0.0.32/27"
  subnet_ipv6_cidr_block                  = "2a05:d014:190:c620::/64"
  subnet_map_public_ip_on_launch          = false
  subnet_name                             = "app-a"
  subnet_resource_type                    = "nonprod"
  tenancy                                 = "default"
  vpc_cidr_block                          = "10.0.0.0/24"
  vpc_instance_tenancy                    = "default"
  vpc_name                                = "sg-nonprod-1"
  vpc_resource_type                       = "nonprod"
}