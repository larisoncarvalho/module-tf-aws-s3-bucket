region = "eu-central-1"

ec2_private_runner = {
  ami_id                 = "ami-03250b0e01c28d196"
  instance_type          = "t2.medium"
  availability_zone      = "eu-central-1a"
  key_name               = "taher-private-runner"
  vpc_security_group_ids = ["sg-092a5ff991a0802bc"]
  subnet_id              = "subnet-072669658da496c4a"
  source_dest_check      = false
  ebs_optimized          = false
  monitoring             = false
  tenancy                = "default"
  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
    http_protocol_ipv6          = "disabled"
    instance_metadata_tags      = "disabled"
  }
  enclave_options_enabled = false
  tags = {
    Name = "taher-private-runner-ubuntu"
  }
}