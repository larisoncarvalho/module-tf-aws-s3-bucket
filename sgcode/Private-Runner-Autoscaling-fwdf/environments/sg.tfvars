lambda_functions = {
  neha_private_runner_autoscale_private_runner = {
    function_name = "Neha_Private_Runner-autoscale-private-runner"
    architectures = ["arm64"]
    memory_size   = 128
    timeout       = 60
    package_type  = "Image"
    image_uri     = "790543352839.dkr.ecr.eu-central-1.amazonaws.com/private-runner/autoscaler:94db8a6-dirty"
    lambda_role   = "arn:aws:iam::790543352839:role/Neha_Private_Runner-autoscale-lambda-role"
    tracing_mode  = "PassThrough"
    environment_variables = {
      AWS_ASG_NAME                = "Neha_Private_Runner-private-runner-asg"
      AWS_BUCKET_NAME             = "7ungwu6v-private-runner-storage-backend"
      MIN_RUNNERS                 = "1"
      SCALE_IN_COOLDOWN_DURATION  = "5"
      SCALE_IN_STEP               = "1"
      SCALE_IN_THRESHOLD          = "1"
      SCALE_OUT_COOLDOWN_DURATION = "4"
      SCALE_OUT_STEP              = "1"
      SCALE_OUT_THRESHOLD         = "3"
      SG_BASE_URI                 = "https://testapi.qa.stackguardian.io"
      SG_ORG                      = "demo-org"
      SG_RUNNER_GROUP             = "Neha_Private_Runner-runner-group-790543352839"
    }
    cloudwatch_logs_retention_in_days = 14
    ignore_source_code_hash           = true
  }
  sg_runner_new_autoscale_private_runner = {
    function_name = "SG_RUNNER_new-autoscale-private-runner"
    architectures = ["arm64"]
    memory_size   = 128
    timeout       = 60
    package_type  = "Image"
    image_uri     = "790543352839.dkr.ecr.eu-central-1.amazonaws.com/private-runner/autoscaler:latest"
    lambda_role   = "arn:aws:iam::790543352839:role/SG_RUNNER_new-autoscale-lambda-role"
    tracing_mode  = "PassThrough"
    environment_variables = {
      AWS_ASG_NAME                = "SG_RUNNER_new-private-runner-asg"
      AWS_BUCKET_NAME             = "2dlru2rs-private-runner-storage-backend"
      MIN_RUNNERS                 = "1"
      SCALE_IN_COOLDOWN_DURATION  = "5"
      SCALE_IN_STEP               = "1"
      SCALE_IN_THRESHOLD          = "2"
      SCALE_OUT_COOLDOWN_DURATION = "3"
      SCALE_OUT_STEP              = "1"
      SCALE_OUT_THRESHOLD         = "5"
      SG_BASE_URI                 = "https://testapi.qa.stackguardian.io"
      SG_ORG                      = "demo-org"
      SG_RUNNER_GROUP             = "SG_RUNNER_new-runner-group-790543352839"
    }
    cloudwatch_logs_retention_in_days = 14
    ignore_source_code_hash           = true
  }
}
