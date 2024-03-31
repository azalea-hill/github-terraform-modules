# Create branch protection for the main branch
resource "github_branch_protection" "this" {
  repository_id                   = var.repository_id
  pattern                         = var.default_branch
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
