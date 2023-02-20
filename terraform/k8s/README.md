<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.1, >= 1.1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.53.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.17.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.53.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.17.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.pmacademy](https://registry.terraform.io/providers/hashicorp/aws/4.53.0/docs/resources/eks_cluster) | resource |
| [aws_ssm_parameter.postgresql_db_name](https://registry.terraform.io/providers/hashicorp/aws/4.53.0/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.postgresql_endpoint](https://registry.terraform.io/providers/hashicorp/aws/4.53.0/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.postgresql_password](https://registry.terraform.io/providers/hashicorp/aws/4.53.0/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.postgresql_username](https://registry.terraform.io/providers/hashicorp/aws/4.53.0/docs/resources/ssm_parameter) | resource |
| [kubernetes_secret.postgresql_connection_secrets](https://registry.terraform.io/providers/hashicorp/kubernetes/2.17.0/docs/resources/secret) | resource |
| [aws_iam_role.AWSServiceRoleForAmazonEKS](https://registry.terraform.io/providers/hashicorp/aws/4.53.0/docs/data-sources/iam_role) | data source |
| [aws_ssm_parameter.postgresql_password](https://registry.terraform.io/providers/hashicorp/aws/4.53.0/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region | `string` | `"eu-central-1"` | no |
| <a name="input_delete_after"></a> [delete\_after](#input\_delete\_after) | Last day of resource existing if is\_temporary == true. Format dd.mm.yyyy. If resource is not temporary, then default values is valid (-) | `string` | `"-"` | no |
| <a name="input_env"></a> [env](#input\_env) | Environment | `string` | n/a | yes |
| <a name="input_is_temporary"></a> [is\_temporary](#input\_is\_temporary) | Set to true if this resource created temporary and should be removed after var.delete\_after | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Default tag for AWS provider | `map(string)` | <pre>{<br>  "Project": "k8s",<br>  "Team": "group7",<br>  "Terraform": "true"<br>}</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->