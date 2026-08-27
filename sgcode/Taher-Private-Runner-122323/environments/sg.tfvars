instances = {
  taher_private_runner_amz = {
    ami_id                      = "ami-0b74f796d330ab49c"
    instance_type               = "t2.medium"
    key_name                    = "taher-private-runner"
    subnet_id                   = "subnet-072669658da496c4a"
    vpc_security_group_ids      = ["sg-092a5ff991a0802bc"]
    availability_zone           = "eu-central-1a"
    associate_public_ip_address = false
    source_dest_check           = true
    ebs_optimized               = false
    monitoring                  = false
    root_block_device = {
      volume_type           = "gp3"
      volume_size           = 24
      delete_on_termination = true
      encrypted             = false
    }
    metadata_options = {
      http_endpoint               = "enabled"
      http_tokens                 = "required"
      http_put_response_hop_limit = 2
      instance_metadata_tags      = "disabled"
    }
    tags = {
      Name = "taher-private-runner-amz"
    }
  }
}

ebs_volumes = {
  vol_0eee7b20020c3cdac = {
    availability_zone    = "eu-central-1a"
    size                 = 24
    type                 = "gp3"
    iops                 = 3000
    throughput           = 125
    encrypted            = false
    snapshot_id          = "snap-06a09a66f5eced5fb"
    multi_attach_enabled = false
  }
}

key_pairs = {}

network_interfaces = {
  eni_0cde3d4209449554a = {
    subnet_id         = "subnet-072669658da496c4a"
    private_ips       = ["10.0.0.41"]
    security_groups   = ["sg-092a5ff991a0802bc"]
    description       = ""
    source_dest_check = true
  }
}
