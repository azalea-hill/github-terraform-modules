output "repo_id" {
  description = "The ID of the repository"
  value       = github_repository.repo.id
}

output "repo_name" {
  description = "The name of the repository"
  value       = github_repository.repo.name
}
