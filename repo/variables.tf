variable "repo_name" {
  description = "The name of the repository"
  type        = string
}

variable "repo_description" {
  description = "The description of the repository"
  type        = string
}

variable "repo_visibility" {
  description = "The visibility of the repository"
  type        = string
  default     = "private"
}

variable "repo_enable_dependabot" {
  description = "Enable dependabot for the repository"
  type        = bool
  default     = true
}

variable "repo_deletion_protection" {
  description = "Enable deletion protection for the repository"
  type        = bool
  default     = true
}

variable "repo_gitignore_template" {
  description = "The gitignore template to use for the repository"
  type        = string
  default     = null
}

variable "repo_license_template" {
  description = "The license template to use for the repository"
  type        = string
  default     = null
}

variable "pull_request_delete_branch_on_merge" {
  description = "Automatically delete head branches on merge"
  type        = bool
  default     = true
}

variable "pull_request_suggest_update_branch" {
  description = "Always suggest updating pull request branches"
  type        = bool
  default     = true
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
