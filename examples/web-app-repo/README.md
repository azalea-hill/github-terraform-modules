# Example module usage for a web app repo

This example creates the repository, trunk-based PR workflow with branch protections, as well as dev, stage, and prod environments with appropriate deployment restrictions and approval workflow.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 6.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_web_app_dev_env"></a> [web\_app\_dev\_env](#module\_web\_app\_dev\_env) | ../../modules/environment | n/a |
| <a name="module_web_app_prod_env"></a> [web\_app\_prod\_env](#module\_web\_app\_prod\_env) | ../../modules/environment | n/a |
| <a name="module_web_app_repo"></a> [web\_app\_repo](#module\_web\_app\_repo) | ../../modules/repository | n/a |
| <a name="module_web_app_repo_pr_workflow"></a> [web\_app\_repo\_pr\_workflow](#module\_web\_app\_repo\_pr\_workflow) | ../../modules/pr-workflow | n/a |
| <a name="module_web_app_staging_env"></a> [web\_app\_staging\_env](#module\_web\_app\_staging\_env) | ../../modules/environment | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
