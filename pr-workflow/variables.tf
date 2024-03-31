variable "repository_id" {
  description = "The ID of the GitHub repository"
  type        = string
}

variable "default_branch" {
  description = "The default branch for the repository"
  type        = string
  default     = "main"
}

variable "pull_request_workflow_admins" {
  description = "List of users or teams that are allowed bypass branch protections"
  type        = list(string)
  default     = []
}

variable "strict_branch_protection" {
  description = "Require strict branch protections. Sets require_conversation_resolution, dismiss_stale_reviews, require_signed_commits, and require_last_push_approval to true"
  type        = bool
  default     = false
}

variable "branch_protection_review_count" {
  description = "Require x number of approvals to satisfy branch protection requirements. If this is specified it must be a number between 0-6"
  type        = number
  default     = 1
}
