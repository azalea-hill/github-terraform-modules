variable "default_branch" {
  # @todo: Find a way to not require this as a variable.
  # The issue is that the repo is always created with the default branch set in the organization
  # and there is no way to read the default branch from the organization.
  description = "The default branch for the organziation or account"
  type        = string
}

variable "name" {
  description = "The name of the repository"
  type        = string
}

variable "description" {
  description = "The description of the repository"
  type        = string
  default     = null
}

variable "visibility" {
  description = "The visibility of the repository"
  type        = string
}

variable "gitignore_template" {
  description = "The gitignore template to use for the repository"
  type        = string
  default     = null
}

variable "license_template" {
  description = "The license template to use for the repository"
  type        = string
  default     = null
}

variable "archived" {
  description = "Archive the repository"
  type        = bool
  default     = false
}
