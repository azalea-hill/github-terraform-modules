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
