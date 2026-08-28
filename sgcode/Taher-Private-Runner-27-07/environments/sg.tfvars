instances = {
  taher_private_runner_amz = {
    ami                     = "ami-0b74f796d330ab49cas"
    instance_type           = "t2.medium"
    subnet_id               = "subnet-072669658da496c4aas"
    vpc_security_group_ids  = ["sg-092a5ff991a0802bc"]
    key_name                = "taher-private-runner"
    availability_zone       = "eu-central-1b"
    tenancy                 = "default"
    ebs_optimized           = false
    source_dest_check       = true
    monitoring              = false
    hibernation             = false
    enclave_options_enabled = false
    root_block_device = {
      volume_type           = "gp3"
      volume_size           = 24
      iops                  = 3000
      throughput            = 125
      delete_on_termination = true
      encrypted             = false
    }
    metadata_options = {
      http_endpoint               = "enabled"
      http_tokens                 = "required"
      http_put_response_hop_limit = 2
      instance_metadata_tags      = "disabled"
    }
    cpu_options = {
      core_count       = 2
      threads_per_core = 1
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
    volume_type          = "gp3"
    iops                 = 3000
    throughput           = 125
    encrypted            = false
    snapshot_id          = "snap-06a09a66f5eced5fb"
    multi_attach_enabled = false
    tags                 = {}
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
    tags              = {}
  }
}
