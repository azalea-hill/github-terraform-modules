output "repo_id" {
  description = "GitHub ID for the repository"
  value       = github_repository.this.repo_id
}

output "node_id" {
  description = "GraphQL global node id for use with v4 API"
  value       = github_repository.this.node_id
}

output "name" {
  description = "The name of the repository"
  value       = github_repository.this.name
}

output "full_name" {
  description = "A string of the form \"orgname/reponame\""
  value       = github_repository.this.full_name
}
