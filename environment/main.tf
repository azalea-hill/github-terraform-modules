# Create the environment
resource "github_repository_environment" "this" {
  environment         = var.name
  repository          = var.repository_name
  can_admins_bypass   = false
  prevent_self_review = false

  reviewers {
    users = toset(var.deployment_reviewers)
  }

  deployment_branch_policy {
    protected_branches     = false
    custom_branch_policies = length(var.branch_restriction_patterns) > 0
  }
}

# Restrict the environment to the trunk branch
resource "github_repository_environment_deployment_policy" "this" {
  for_each       = toset(var.branch_restriction_patterns)
  environment    = github_repository_environment.this.environment
  repository     = github_repository_environment.this.repository
  branch_pattern = each.value
}
