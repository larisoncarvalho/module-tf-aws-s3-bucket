instances = {
  taher_dev_private_runner_golang_utility = {
    ami                    = "ami-03250b0e01c28d196"
    instance_type          = "t2.medium"
    key_name               = "taher-private-runner"
    subnet_id              = "subnet-072669658da496c4a"
    vpc_security_group_ids = ["sg-092a5ff991a0802bc"]
    source_dest_check      = true
    monitoring             = false
    ebs_optimized          = false
    tags = {
      Name = "taher-dev-private-runner-golang-utility"
    }
    metadata_options = {
      http_endpoint               = "enabled"
      http_tokens                 = "required"
      http_put_response_hop_limit = 2
      http_protocol_ipv6          = "disabled"
      instance_metadata_tags      = "disabled"
    }
    root_block_device = {
      volume_type           = "gp3"
      volume_size           = 32
      delete_on_termination = true
      encrypted             = false
    }
  }
}

ebs_volumes = {
  vol_03763f8c1fcd428c8 = {
    availability_zone    = "eu-central-1a"
    size                 = 32
    type                 = "gp3"
    iops                 = 3000
    throughput           = 125
    encrypted            = false
    multi_attach_enabled = false
    snapshot_id          = "snap-0a07d122afed3f01c"
  }
}

network_interfaces = {
  eni_042be8ba683617c82 = {
    subnet_id         = "subnet-072669658da496c4a"
    security_groups   = ["sg-092a5ff991a0802bc"]
    private_ips       = ["10.0.0.62"]
    source_dest_check = true
    description       = ""
  }
}
