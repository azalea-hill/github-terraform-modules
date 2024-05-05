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

variable "variables" {
  description = "GitHub Actions variables to set on the repository"
  type        = map(string)
  default     = {}
}

variable "secrets" {
  description = "GitHub Actions secret keys to create in the repository"
  type        = list(string)
  default     = []
}
