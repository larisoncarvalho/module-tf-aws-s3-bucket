output "subnet_id" {
  value       = module.pa_test_public_subnet.subnet_id
  description = "The ID of the subnet"
}

output "subnet_availability_zone" {
  value       = module.pa_test_public_subnet.availability_zone
  description = "The availability zone of the subnet"
}