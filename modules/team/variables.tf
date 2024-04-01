variable "name" {
  description = "The name of the team"
  type        = string
}

variable "description" {
  description = "The description of the team"
  type        = string
}

variable "maintainers" {
  description = "The maintainers of the team"
  type        = list(string)
  default     = []
}

variable "members" {
  description = "The members of the team"
  type        = list(string)
  default     = []
}
