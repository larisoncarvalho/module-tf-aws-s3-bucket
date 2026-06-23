# Environment variable values for the discovered IAM roles

iam_roles = {
  non_prod_adis_us_west_2_admin_task_execution_role = {
    name = "non-prod-adis-us-west-2-admin-task-execution-role"
    path = "/"

    assume_role_policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Sid\":\"\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::790543352839:root\",\"Service\":\"ecs-tasks.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"

    max_session_duration = 3600

    attached_policy_arns = [
      "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",
      "arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess",
      "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
      "arn:aws:iam::aws:policy/AmazonElasticFileSystemClientReadWriteAccess",
    ]

    tags = {
      Environment     = "non-prod-adis"
      Warning         = "Do-Not-Modify-Or-Delete"
      "Resource-Type" = "ECS Cluster"
      ManagedBy       = "StackGuardian-Infra-Team"
    }
  }
}
