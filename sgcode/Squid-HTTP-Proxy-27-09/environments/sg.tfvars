instances = {
  taher_http_squid_proxy = {
    ami                    = "ami-07eef52105e8a2059"
    instance_type          = "t2.micro"
    key_name               = "taher-private-runner"
    subnet_id              = "subnet-02aff1dbfda577bb1"
    vpc_security_group_ids = ["sg-092a5ff991a0802bc"]
    source_dest_check      = true
    ebs_optimized          = false
    monitoring             = false
    tenancy                = "default"
    availability_zone      = "eu-central-1a"
    tags = {
      Name = "taher-http-squid-proxy"
    }
    root_block_device = {
      volume_type           = "gp3"
      volume_size           = 8
      delete_on_termination = true
      encrypted             = false
    }
    metadata_options = {
      http_endpoint               = "enabled"
      http_tokens                 = "required"
      http_put_response_hop_limit = 2
      instance_metadata_tags      = "disabled"
    }
  }
}

ebs_volumes = {
  vol_0c902488affe65a8a = {
    availability_zone    = "eu-central-1a"
    size                 = 8
    type                 = "gp3"
    iops                 = 3000
    throughput           = 125
    encrypted            = false
    snapshot_id          = "snap-0e964d47a186bf0a7"
    multi_attach_enabled = false
  }
}


network_interfaces = {
  eni_0255b9b3f7b719ee0 = {
    subnet_id         = "subnet-02aff1dbfda577bb1"
    security_groups   = ["sg-092a5ff991a0802bc"]
    description       = ""
    private_ips       = ["10.0.0.20"]
    source_dest_check = true
  }
}
