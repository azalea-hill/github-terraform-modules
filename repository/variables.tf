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
  default     = "private"
}
