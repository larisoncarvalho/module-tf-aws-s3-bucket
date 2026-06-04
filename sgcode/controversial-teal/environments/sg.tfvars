region = "eu-central-1"

instance_ami                                     = "ami-03250b0e01c28d196"
instance_instance_type                           = "t2.medium"
instance_availability_zone                       = "eu-central-1a"
instance_subnet_id                               = "subnet-072669658da496c4a"
instance_vpc_security_group_ids                  = ["sg-092a5ff991a0802bc"]
instance_source_dest_check                       = true
instance_ebs_optimized                           = false
instance_monitoring                              = false
instance_tenancy                                 = "default"
instance_tags                                    = { Name = "taher-private-runner-ubuntu" }
instance_metadata_http_endpoint                  = "enabled"
instance_metadata_http_protocol_ipv6             = "disabled"
instance_metadata_http_put_response_hop_limit    = 2
instance_metadata_http_tokens                    = "required"
instance_metadata_instance_metadata_tags         = "disabled"
instance_capacity_reservation_preference         = "open"
instance_enclave_options_enabled                 = false
instance_root_block_device_delete_on_termination = true

ebs_volume_availability_zone    = "eu-central-1a"
ebs_volume_size                 = 32
ebs_volume_type                 = "gp3"
ebs_volume_iops                 = 3000
ebs_volume_throughput           = 125
ebs_volume_encrypted            = false
ebs_volume_multi_attach_enabled = false
ebs_volume_snapshot_id          = "snap-0a07d122afed3f01c"

key_pair_key_name   = "taher-private-runner"
key_pair_public_key = ""

network_interface_subnet_id         = "subnet-072669658da496c4a"
network_interface_private_ips       = ["10.0.0.52"]
network_interface_security_groups   = ["sg-092a5ff991a0802bc"]
network_interface_source_dest_check = true