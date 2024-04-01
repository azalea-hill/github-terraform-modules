resource "github_team" "this" {
  name        = var.name
  description = var.description
  privacy     = "closed"
}
