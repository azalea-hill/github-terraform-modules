# Create the environment
resource "github_repository_environment" "this" {
  environment         = var.name
  repository          = var.repository_name
  can_admins_bypass   = false
  prevent_self_review = false

  reviewers {
    teams = toset(var.deployment_reviewers)
  }

  deployment_branch_policy {
    protected_branches     = false
    custom_branch_policies = true
  }
}

# Restrict the environment to the trunk branch
resource "github_repository_environment_deployment_policy" "this" {
  environment    = github_repository_environment.this.environment
  repository     = github_repository_environment.this.repository
  branch_pattern = var.trunk_branch
}
