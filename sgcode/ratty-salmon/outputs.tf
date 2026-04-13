output "role_assignment_id" {
  description = "The ID of the role assignment"
  value       = module.role_assignment.id
}

output "role_assignment_principal_id" {
  description = "The principal ID of the role assignment"
  value       = module.role_assignment.principal_id
}