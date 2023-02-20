<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.1, >= 1.1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.53.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.53.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.postgres_rds](https://registry.terraform.io/providers/hashicorp/aws/4.53.0/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.subnet_group](https://registry.terraform.io/providers/hashicorp/aws/4.53.0/docs/resources/db_subnet_group) | resource |
| [aws_security_group.postgres_rds_sg](https://registry.terraform.io/providers/hashicorp/aws/4.53.0/docs/resources/security_group) | resource |
| [aws_ssm_parameter.postgresql_db_name](https://registry.terraform.io/providers/hashicorp/aws/4.53.0/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.postgresql_endpoint](https://registry.terraform.io/providers/hashicorp/aws/4.53.0/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.postgresql_password](https://registry.terraform.io/providers/hashicorp/aws/4.53.0/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.postgresql_username](https://registry.terraform.io/providers/hashicorp/aws/4.53.0/docs/resources/ssm_parameter) | resource |
| [aws_vpc.pmacademy](https://registry.terraform.io/providers/hashicorp/aws/4.53.0/docs/resources/vpc) | resource |
| [random_password.postgresql_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_ssm_parameter.postgresql_password](https://registry.terraform.io/providers/hashicorp/aws/4.53.0/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_airflow_db_name"></a> [airflow\_db\_name](#input\_airflow\_db\_name) | Default name for PostgreSQL RDS DB for airflow | `string` | `"postgresdb_airflow"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region | `string` | `"eu-central-1"` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | Default name for PostgreSQL RDS DB | `string` | `"postgresdb"` | no |
| <a name="input_delete_after"></a> [delete\_after](#input\_delete\_after) | Last day of resource existing if is\_temporary == true. Format dd.mm.yyyy. If resource is not temporary, then default values is valid (-) | `string` | `"-"` | no |
| <a name="input_env"></a> [env](#input\_env) | Environment | `string` | n/a | yes |
| <a name="input_is_temporary"></a> [is\_temporary](#input\_is\_temporary) | Set to true if this resource created temporary and should be removed after var.delete\_after | `bool` | `false` | no |
| <a name="input_postgresql_username"></a> [postgresql\_username](#input\_postgresql\_username) | Username for PostgreSQL RDS | `string` | `"postgres"` | no |
| <a name="input_rds_identifier"></a> [rds\_identifier](#input\_rds\_identifier) | Default identifier for PostgreSQL RDS | `string` | `"postgresql-rds-group7"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Private subnet ids fro rds instance | `list` | <pre>[<br>  "subnet-0ebf606fa76f66751",<br>  "subnet-01d782adcf5a9762f",<br>  "subnet-09b0ce7faeeb4c648"<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Default tag for AWS provider | `map(string)` | <pre>{<br>  "Project": "postgresql",<br>  "Team": "group7",<br>  "Terraform": "true"<br>}</pre> | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | VPC CIDR | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vpc_tags"></a> [vpc\_tags](#input\_vpc\_tags) | Tags of VPC, that was that was already created | `map(string)` | <pre>{<br>  "Example": "pmacademy",<br>  "GithubOrg": "terraform-aws-modules",<br>  "GithubRepo": "terraform-aws-eks",<br>  "Name": "pmacademy"<br>}</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->