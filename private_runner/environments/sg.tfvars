key_pairs = {
  taher_private_runner = {
    key_name = "taher-private-runner"
  }
}

ebs_volumes = {
  vol_072212cd519ee269f = {
    availability_zone    = "eu-central-1a"
    size                 = 32
    volume_type          = "gp3"
    iops                 = 3000
    throughput           = 125
    encrypted            = false
    multi_attach_enabled = false
  }
}

network_interfaces = {
  eni_0ad57450ced1dd2d6 = {
    subnet_id         = "subnet-072669658da496c4a"
    private_ips       = ["10.0.0.52"]
    security_groups   = ["sg-092a5ff991a0802bc"]
    source_dest_check = true
    description       = ""
  }
}

instances = {
  taher_private_runner_ubuntu = {
    ami                    = "ami-03250b0e01c28d196"
    instance_type          = "t2.medium"
    key_name               = "taher-private-runner"
    subnet_id              = "subnet-072669658da496c4a"
    vpc_security_group_ids = ["sg-092a5ff991a0802bc"]
    availability_zone      = "eu-central-1a"
    tenancy                = "default"
    monitoring             = false
    ebs_optimized          = false
    source_dest_check      = true

    root_volume_size                  = 32
    root_volume_type                  = "gp3"
    root_volume_delete_on_termination = true

    metadata_http_endpoint               = "enabled"
    metadata_http_tokens                 = "required"
    metadata_http_put_response_hop_limit = 2

    cpu_core_count       = 2
    cpu_threads_per_core = 1

    tags = {
      Name = "taher-private-runner-ubuntu"
    }
  }
}
