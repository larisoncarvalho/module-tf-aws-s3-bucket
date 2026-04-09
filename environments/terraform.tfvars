region = "eu-central-1"

instances = {
  nomatch_ec2_1 = {
    ami_id                               = "ami-0ec8eb5bed8fa47f1"
    instance_type                        = "t3.medium"
    availability_zone                    = "eu-central-1a"
    key_name                             = "grouping-test-key"
    subnet_id                            = null
    security_group_ids                   = null
    associate_public_ip_address          = null
    source_dest_check                    = null
    ebs_optimized                        = false
    monitoring                           = false
    tenancy                              = "default"
    hibernation                          = false
    enclave_enabled                      = false
    metadata_http_endpoint               = "enabled"
    metadata_http_tokens                 = "optional"
    metadata_http_put_response_hop_limit = 1
    metadata_http_protocol_ipv6          = "disabled"
    metadata_instance_metadata_tags      = "disabled"
    capacity_reservation_preference      = "open"
    cpu_core_count                       = 1
    cpu_threads_per_core                 = 2
    root_volume_type                     = null
    root_delete_on_termination           = null
    tags = {
      Project = "infra2code-grouping-test"
      Name    = "nomatch-ec2-1"
    }
  }
  taher_private_runner_amz = {
    ami_id                               = "ami-0b74f796d330ab49c"
    instance_type                        = "t2.medium"
    availability_zone                    = "eu-central-1a"
    key_name                             = "taher-private-runner"
    subnet_id                            = "subnet-072669658da496c4a"
    security_group_ids                   = ["sg-092a5ff991a0802bc"]
    associate_public_ip_address          = null
    source_dest_check                    = true
    ebs_optimized                        = false
    monitoring                           = false
    tenancy                              = "default"
    hibernation                          = false
    enclave_enabled                      = false
    metadata_http_endpoint               = "enabled"
    metadata_http_tokens                 = "required"
    metadata_http_put_response_hop_limit = 2
    metadata_http_protocol_ipv6          = "disabled"
    metadata_instance_metadata_tags      = "disabled"
    capacity_reservation_preference      = "open"
    cpu_core_count                       = 2
    cpu_threads_per_core                 = 1
    root_volume_type                     = null
    root_delete_on_termination           = true
    tags = {
      Name = "taher-private-runner-amz"
    }
  }
}