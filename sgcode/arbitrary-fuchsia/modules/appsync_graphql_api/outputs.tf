output "api_id" {
  description = "ID of the AppSync GraphQL API"
  value       = aws_appsync_graphql_api.this.id
}

output "uris" {
  description = "URIs of the AppSync GraphQL API"
  value       = aws_appsync_graphql_api.this.uris
}