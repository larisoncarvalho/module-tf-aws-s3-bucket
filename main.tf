module "orchestrator_resources_qa" {
  source = "./modules/s3_bucket"

  bucket_name = "orchestrator-resources-qa
  owner_id    = "9384ba540c1093b9523308500d905bb6385ccb904afa22a41b8309ad4cc458ff"
  policy_principals = [
    "arn:aws:iam::756925330322:root",
    "arn:aws:iam::790543352839:root",
    "arn:aws:iam::756925330322:role/ecs-workflow-admin-task-execution-role-qa",
    "arn:aws:iam::756925330322:role/ecs-workflow-admin-task-service-role-qa"
  ]
}