region = "eu-central-1"

key_pair_key_name   = "taher-private-runner"
key_pair_public_key = ""

instance_ami_id                                  = "ami-03250b0e01c28d196"
instance_instance_type                           = "t2.medium"
instance_tenancy                                 = "default"
instance_ebs_optimized                           = false
instance_monitoring                              = false
instance_hibernation                             = false
instance_cpu_core_count                          = 2
instance_cpu_threads_per_core                    = 1
instance_metadata_http_endpoint                  = "enabled"
instance_metadata_http_tokens                    = "required"
instance_metadata_http_put_response_hop_limit    = 2
instance_enclave_options_enabled                 = false
instance_capacity_reservation_preference         = "open"
instance_root_block_device_delete_on_termination = true
instance_subnet_id                               = "subnet-072669658da496c4a"
instance_private_ip_address                      = "10.0.0.52"
instance_security_group_ids                      = ["sg-092a5ff991a0802bc"]
instance_source_dest_check                       = true
instance_instance_name_tag                       = "taher-private-runner-ubuntu"