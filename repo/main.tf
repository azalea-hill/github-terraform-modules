locals {
  # @todo: Find a way to not hardcode this.
  # The issue is that the repo is always created with the default branch set in the organization
  # and there is no way to read the default branch from the organization.
  default_branch = "main"
}

# Create and initialize the repository
resource "github_repository" "repo" {
  # Basic configs to create repository
  name               = var.repo_name
  description        = var.repo_description
  visibility         = var.repo_visibility
  auto_init          = true
  gitignore_template = var.repo_gitignore_template
  license_template   = var.repo_license_template

  # PR merge behavior
  allow_squash_merge          = true
  squash_merge_commit_title   = "PR_TITLE"
  squash_merge_commit_message = "PR_BODY"
  delete_branch_on_merge      = var.pull_request_delete_branch_on_merge
  allow_update_branch         = var.pull_request_suggest_update_branch
  allow_merge_commit          = false
  allow_rebase_merge          = false
  allow_auto_merge            = false

  # Security and deletion protection
  vulnerability_alerts = var.repo_enable_dependabot
  archive_on_destroy   = var.repo_deletion_protection
  # archived = false

  # Additional disabled features
  has_issues                  = false
  has_discussions             = false
  has_projects                = false
  has_wiki                    = false
  is_template                 = false
  web_commit_signoff_required = false
  has_downloads               = false
}

# Dependabot security updates
resource "github_repository_dependabot_security_updates" "repo" {
  repository = github_repository.repo.id
  enabled    = var.repo_enable_dependabot
}

# Make sure the default branch is set as the default branch
resource "github_branch_default" "default" {
  repository = github_repository.repo.name
  branch     = local.default_branch
}

# Create branch protection for the default branch
resource "github_branch_protection" "default" {
  repository_id                   = github_repository.repo.id
  pattern                         = local.default_branch
  enforce_admins                  = true
  require_signed_commits          = var.strict_branch_protection
  required_linear_history         = true
  require_conversation_resolution = var.strict_branch_protection
  force_push_bypassers            = []
  allows_deletions                = false
  allows_force_pushes             = false
  lock_branch                     = false

  required_status_checks {
    strict = true
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = var.strict_branch_protection
    restrict_dismissals             = true
    dismissal_restrictions          = toset(var.pull_request_workflow_admins)
    pull_request_bypassers          = toset(var.pull_request_workflow_admins)
    require_code_owner_reviews      = true
    required_approving_review_count = var.branch_protection_review_count
    require_last_push_approval      = var.strict_branch_protection
  }

  restrict_pushes {
    blocks_creations = true
    push_allowances  = []
  }
}

data "github_team" "admin_team" {
  slug = "administrators"
}

# environments
resource "github_repository_environment" "production" {
  repository          = github_repository.repo.name
  environment         = "production"
  can_admins_bypass   = false
  prevent_self_review = false

  reviewers {
    teams = toset([data.github_team.admin_team.id])
  }

  deployment_branch_policy {
    protected_branches     = false
    custom_branch_policies = true
  }
}

resource "github_repository_environment_deployment_policy" "production" {
  repository     = github_repository.repo.name
  environment    = github_repository_environment.production.environment
  branch_pattern = "main"
}

# variables

# secrets
