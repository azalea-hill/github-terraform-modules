resource "github_team_members" "this" {
  team_id = github_team.this.id

  dynamic "members" {
    for_each = var.maintainers
    content {
      username = members.value
      role     = "maintainer"
    }
  }

  dynamic "members" {
    for_each = var.members
    content {
      username = members.value
      role     = "member"
    }
  }
}
