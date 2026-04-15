output "de_manuel_meireles_workgroup_id" {
  value       = module.de_manuel_meireles_primary_workgroup.workgroup_id
  description = "ID of de-manuel-meireles primary workgroup"
}

output "platform_api_dev_id" {
  value       = module.platform_api_dev.api_id
  description = "ID of platform-api-dev"
}

output "sg_api_qa_id" {
  value       = module.sg_api_qa.api_id
  description = "ID of sg-api-qa"
}

output "arunim_test_api_id" {
  value       = module.arunim_test_api.api_id
  description = "ID of arunim-test-api"
}