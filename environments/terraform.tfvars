region = "global"

attached_policies = {
  ssm_managed_instance = {
    policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }
  s3_assume_role = {
    policy_arn = "arn:aws:iam::790543352839:policy/Neha_Private_Runner-ec2-runner-assume-s3-role-policy"
  }
}