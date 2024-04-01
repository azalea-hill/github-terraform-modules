output "team_id" {
  description = "The ID of the team"
  value       = github_team.this.id
}

output "node_id" {
  description = "The Node ID of the team"
  value       = github_team.this.node_id
}

output "slug" {
  description = "The slug of the team"
  value       = github_team.this.slug
}
