variable "name" {
  description = "The name of the environment"
  type        = string
}

variable "repository_name" {
  description = "The name of the GitHub repository"
  type        = string
}

variable "deployment_reviewers" {
  description = "Specify users that may approve workflow runs when they access this environment"
  type        = list(string)
  default     = []
}

variable "branch_restriction_patterns" {
  description = "Specify branch restrictions for the environment"
  type        = list(string)
  default     = []
}
