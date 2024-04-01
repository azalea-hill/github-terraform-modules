module "engineering_team" {
  source      = "../../modules/team"
  name        = "Engineering Team"
  description = "Team for the engineering department"
  maintainers = ["some-admin-user"]
  members     = ["some-engineer-user-1", "some-engineer-user-2", "some-engineer-user-3"]
}
