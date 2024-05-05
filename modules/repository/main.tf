# Base repository configuration
resource "github_repository" "this" {
  name                                    = var.name
  description                             = var.description
  visibility                              = var.visibility
  has_issues                              = var.visibility == "public" ? true : false
  has_discussions                         = false
  has_projects                            = false
  has_wiki                                = false
  is_template                             = false
  allow_merge_commit                      = false
  allow_squash_merge                      = true
  allow_rebase_merge                      = false
  allow_auto_merge                        = false
  squash_merge_commit_title               = "PR_TITLE"
  squash_merge_commit_message             = "PR_BODY"
  delete_branch_on_merge                  = true
  web_commit_signoff_required             = false
  auto_init                               = true
  gitignore_template                      = var.gitignore_template
  license_template                        = var.license_template
  archived                                = var.archived
  archive_on_destroy                      = true
  vulnerability_alerts                    = true
  ignore_vulnerability_alerts_during_read = false
  allow_update_branch                     = true
}

# Dependabot security updates
resource "github_repository_dependabot_security_updates" "this" {
  repository = github_repository.this.id
  enabled    = true
}

# Repository variables
resource "github_actions_variable" "this" {
  for_each      = var.variables
  repository    = github_repository.this.id
  variable_name = each.key
  value         = each.value
}
