# GitHub Repository Development Workflow

This module implements an opinionated [Trunk based development](https://trunkbaseddevelopment.com/) PR workflow for a GitHub repo.

## About this file

The sections of this README between `BEGIN_TF_DOCS` and `END_TF_DOCS` are generated by [`terraform-docs`](https://terraform-docs.io/) based on the definition of the module. You can update the documentation by running `terraform-docs .`

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7 |
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 6.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | >= 6.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_branch_protection.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_branch_protection_review_count"></a> [branch\_protection\_review\_count](#input\_branch\_protection\_review\_count) | Require x number of approvals to satisfy branch protection requirements. If this is specified it must be a number between 0-6 | `number` | `1` | no |
| <a name="input_default_branch"></a> [default\_branch](#input\_default\_branch) | The default branch for the repository | `string` | `"main"` | no |
| <a name="input_pull_request_workflow_admins"></a> [pull\_request\_workflow\_admins](#input\_pull\_request\_workflow\_admins) | List of users or teams that are allowed bypass branch protections | `list(string)` | `[]` | no |
| <a name="input_repository_id"></a> [repository\_id](#input\_repository\_id) | The ID of the GitHub repository | `string` | n/a | yes |
| <a name="input_strict_branch_protection"></a> [strict\_branch\_protection](#input\_strict\_branch\_protection) | Require strict branch protections. Sets require\_conversation\_resolution, dismiss\_stale\_reviews, require\_signed\_commits, and require\_last\_push\_approval to true | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->