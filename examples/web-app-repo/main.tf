provider "github" {
  owner = "YOUR_ORG"
}

module "web_app_repo" {
  source             = "../../repository"
  name               = "web-app"
  description        = "An example web application repository"
  visibility         = "private"
  gitignore_template = "Node"
}

module "web_app_repo_pr_workflow" {
  source                          = "../../pr-workflow"
  repository_id                   = module.web_app_repo.node_id
  required_approving_review_count = 1
  pull_request_bypassers          = ["/admin"]
  pull_request_pushers            = ["/admin", "/lead-dev"]
}

module "web_app_prod_env" {
  source                      = "../../environment"
  name                        = "production"
  repository_name             = module.web_app_repo.name
  deployment_reviewers        = [1234]
  branch_restriction_patterns = ["main"]
}

module "web_app_staging_env" {
  source                      = "../../environment"
  name                        = "staging"
  repository_name             = module.web_app_repo.name
  branch_restriction_patterns = ["feature/*"]
}

module "web_app_dev_env" {
  source          = "../../environment"
  name            = "development"
  repository_name = module.web_app_repo.name
}
