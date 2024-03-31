variable "default_branch" {
  description = "The default branch for the organziation or account"
  type        = string
  default     = "main"
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
