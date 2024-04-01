variable "name" {
  description = "The name of the team"
  type        = string
}

variable "description" {
  description = "The description of the team"
  type        = string
}

variable "team_members" {
  description = "The members of the team"
  type        = list(string)
  default     = []
}

variable "team_maintainers" {
  description = "The maintainers of the team"
  type        = list(string)
  default     = []
}
