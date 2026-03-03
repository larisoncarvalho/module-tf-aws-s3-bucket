vpc_cidr_block = "10.0.0.0/16"
vpc_tags = {
  "Name" = "vpc_name"
}

iam_role_name             = "SG_RUNNER_new-ec2-private-runner-role"
iam_instance_profile_name = "SG_RUNNER_new-runner-instance-profile"
iam_role_path             = "/"

security_group_name        = "SG_RUNNER_new-private-runner-sg"
security_group_description = "Security group for SG runner"

subnet_cidr_block        = "10.0.0.0/24"
subnet_availability_zone = "eu-central-1a"
subnet_tags = {
  "Name" = "vpc_name-public-eu-central-1a"
}

ami_id            = "ami-0c954b75beb1d9bc1"
instance_type     = "t3.medium"
key_name          = "clara-sg-privaterunner"
user_data         = ""
instance_name_tag = "SG_RUNNER_new-private-runner"

asg_name             = "SG_RUNNER_new-private-runner-asg"
asg_desired_capacity = 1
asg_min_size         = 1
asg_max_size         = 1