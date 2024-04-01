variable "repository_id" {
  description = "The name or node ID of the repository associated with this branch protection rule."
  type        = string
}

variable "trunk_branch" {
  description = "The name of the trunk branch for the GitHub repository"
  type        = string
  default     = "main"
}

variable "required_approving_review_count" {
  description = "When enabled, pull requests targeting a matching branch require a number of approvals and no changes requested before they can be merged"
  type        = number
  default     = 1
}

variable "dismiss_stale_reviews" {
  description = "Dismiss stale pull request approvals when new commits are pushed"
  type        = bool
  default     = false
}

variable "require_last_push_approval" {
  description = "Require approval of the most recent reviewable push"
  type        = bool
  default     = false
}

variable "require_signed_commits" {
  description = "Require signed commits"
  type        = bool
  default     = true
}

variable "pull_request_bypassers" {
  description = "Specify people, teams, or apps who are allowed to bypass required pull requests"
  type        = list(string)
  default     = []
}

variable "pull_request_pushers" {
  description = "Specify people, teams, or apps allowed to push to matching branches. Required status checks will still prevent these people, teams, and apps from merging if the checks fail"
  type        = list(string)
  default     = []
}
