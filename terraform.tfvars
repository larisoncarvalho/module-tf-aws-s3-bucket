vpc_cidr_block               = "10.0.0.0/16"
iam_role_name                = "SG_RUNNER_new-ec2-private-runner-role"
iam_instance_profile_name    = "SG_RUNNER_new-runner-instance-profile"
iam_role_path                = "/"
security_group_name          = "SG_RUNNER_new-private-runner"
security_group_description   = "Block inboud and Allow All outbound for Private Runner."
subnet_cidr_block            = "10.0.1.0/24"
subnet_availability_zone     = "eu-central-1a"
ami_id                       = "ami-0084a47cc718c111a"
instance_type                = "t3.medium"
key_name                     = "new-private-runner"
user_data                    = "IyEvdXNyL2Jpbi9lbnYgc2gKCnNldCAtZQoKIyMgUmVnaXN0ZXIgUHJpdmF0ZSBSdW5uZXIKZXhwb3J0IFNHX0JBU0VfQVBJPSJodHRwczovL3Rlc3RhcGkucWEuc3RhY2tndWFyZGlhbi5pby9hcGkvdjEiCnNnLXJ1bm5lciByZWdpc3RlciBcCiAgLS1vcmdhbml6YXRpb24gImRlbW8tb3JnIiBcCiAgLS1ydW5uZXItZ3JvdXAgIlNHX1JVTk5FUl9uZXctcnVubmVyLWdyb3VwLTc5MDU0MzM1MjgzOSIgXAogIC0tc2ctbm9kZS10b2tlbiAic2dyXzU1N2c3NDlmdzlxdjIwMHdzIgo="
instance_name_tag            = "SG_RUNNER_new-private-runner-asg"
asg_name                     = "SG_RUNNER_new-private-runner-asg"
asg_desired_capacity         = 1
asg_min_size                 = 1
asg_max_size                 = 5