output "id" {
  value       = aws_appsync_graphql_api.this.id
  description = "ID of the GraphQL API"
}

output "name" {
  value       = aws_appsync_graphql_api.this.name
  description = "Name of the GraphQL API"
}

output "arn" {
  value       = aws_appsync_graphql_api.this.arn
  description = "ARN of the GraphQL API"
}

output "uris" {
  value       = aws_appsync_graphql_api.this.uris
  description = "URIs of the GraphQL API"
}