region = "eu-central-1"

ec2_taher_private_runner_ubuntu = {
  ami                = "ami-03250b0e01c28d196"
  instance_type      = "t2.medium"
  availability_zone  = "eu-central-1a"
  key_name           = "taher-private-runner"
  subnet_id          = "subnet-072669658da496c4a"
  vpc_security_group_ids = ["sg-092a5ff991a0802bc"]
  ebs_optimized      = false
  monitoring         = false
  source_dest_check  = true
  tenancy            = "default"
  metadata_options = {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }
  enclave_options_enabled = false
  cpu_core_count          = 2
  cpu_threads_per_core    = 1
}