resource "aws_network_interface" "runner" {
  subnet_id         = var.subnet_id
  private_ips       = [var.private_ip]
  security_groups   = [var.security_group_id]
  source_dest_check = true

  tags = {
    Name = "eni-02b2519b0f908256d"
  }
}

resource "aws_instance" "runner" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  iam_instance_profile = var.instance_profile_name
  availability_zone    = var.availability_zone

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.runner.id
  }

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 50
    delete_on_termination = true
  }

  ebs_optimized = false
  monitoring    = false

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
    instance_metadata_tags      = "disabled"
  }

  cpu_core_count       = 1
  cpu_threads_per_core = 2

  tags = {
    Name                              = "SG_RUNNER_new-private-runner-asg"
    "aws:autoscaling:groupName"       = "SG_RUNNER_new-private-runner-asg"
    "aws:ec2launchtemplate:id"        = "lt-0214ccad66ff870eb"
    "aws:ec2launchtemplate:version"   = "1"
  }
}