# Create branch protection for the main branch
resource "github_branch_protection" "trunk" {
  repository_id                   = var.repository_id
  pattern                         = var.trunk_branch
  enforce_admins                  = true
  require_signed_commits          = var.require_signed_commits
  required_linear_history         = true
  require_conversation_resolution = false
  force_push_bypassers            = []
  allows_deletions                = false
  allows_force_pushes             = false
  lock_branch                     = false

  required_pull_request_reviews {
    dismiss_stale_reviews           = var.dismiss_stale_reviews
    restrict_dismissals             = true
    dismissal_restrictions          = toset(var.pull_request_bypassers)
    pull_request_bypassers          = toset(var.pull_request_bypassers)
    require_code_owner_reviews      = true
    required_approving_review_count = var.required_approving_review_count
    require_last_push_approval      = var.require_last_push_approval
  }

  restrict_pushes {
    blocks_creations = true
    push_allowances  = toset(var.pull_request_pushers)
  }
}
