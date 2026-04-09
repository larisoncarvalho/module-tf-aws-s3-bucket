region = "eu-central-1"

instances = {
  taher_private_runner_amz = {
    ami_id                 = "ami-0b74f796d330ab49c"
    instance_type          = "t2.medium"
    availability_zone      = "eu-central-1a"
    key_name               = "taher-private-runner"
    ebs_optimized          = false
    monitoring             = false
    tenancy                = "default"
    subnet_id              = "subnet-072669658da496c4a"
    vpc_security_group_ids = ["sg-092a5ff991a0802bc"]
    source_dest_check      = true
    private_ip             = "10.0.0.41"
    metadata_options = {
      http_endpoint               = "enabled"
      http_tokens                 = "required"
      http_put_response_hop_limit = 2
      instance_metadata_tags      = "disabled"
    }
    root_block_device = {
      volume_type           = "gp2"
      delete_on_termination = true
    }
    tags = {
      Name = "taher-private-runner-amz"
    }
  }
}