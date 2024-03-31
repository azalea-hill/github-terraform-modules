resource "github_repository" "this" {
  # Basic configs to create repository
  name        = var.name
  description = var.description
  visibility  = var.visibility
  auto_init   = true
  # gitignore_template = var.repo_gitignore_template
  # license_template   = var.repo_license_template

  # PR merge behavior
  allow_squash_merge          = true
  squash_merge_commit_title   = "PR_TITLE"
  squash_merge_commit_message = "PR_BODY"
  delete_branch_on_merge      = true
  allow_update_branch         = true
  # delete_branch_on_merge      = var.pull_request_delete_branch_on_merge
  # allow_update_branch         = var.pull_request_suggest_update_branch
  allow_merge_commit = false
  allow_rebase_merge = false
  allow_auto_merge   = false

  # Security and deletion protection
  # vulnerability_alerts = var.repo_enable_dependabot
  # archive_on_destroy   = var.repo_deletion_protection
  vulnerability_alerts = true
  archive_on_destroy   = true
  archived             = false

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
resource "github_repository_dependabot_security_updates" "this" {
  repository = github_repository.this.id
  enabled    = true
  # enabled    = var.repo_enable_dependabot
}

# Make sure the default branch is set as the default branch
resource "github_branch_default" "this" {
  repository = github_repository.this.name
  branch     = var.default_branch
}
