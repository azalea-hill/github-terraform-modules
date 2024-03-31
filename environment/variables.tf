variable "name" {
  description = "The name of the environment"
  type        = string
}

variable "repository_name" {
  description = "The name of the GitHub repository"
  type        = string
}

variable "trunk_branch" {
  description = "The name of the trunk branch for the GitHub repository"
  type        = string
  default     = "main"
}

variable "deployment_reviewers" {
  description = "Specify teams that may approve workflow runs when they access this environment"
  type        = list(string)
  default     = []
}
