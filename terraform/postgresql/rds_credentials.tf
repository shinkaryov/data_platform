resource "aws_ssm_parameter" "postgresql_username" {
  name  = "postgresql_username_group7"
  type  = "String"
  value = var.postgresql_username
}

resource "random_password" "postgresql_password" {
  length  = 16
  special = false
}

resource "aws_ssm_parameter" "postgresql_password" {
  name  = "postgresql_password_group7"
  type  = "SecureString"
  value = random_password.postgresql_password.result
}

resource "aws_ssm_parameter" "postgresql_endpoint" {
  name  = "postgresql_endpoint_group7"
  type  = "String"
  value = aws_db_instance.postgres_rds.endpoint
}

resource "aws_ssm_parameter" "postgresql_db_name" {
  name  = "postgresql_db_name_group7"
  type  = "String"
  value = var.db_name
}

resource "aws_ssm_parameter" "postgresql_api_db_name" {
  name  = "postgresql_api_db_name_group7"
  type  = "String"
  value = var.api_db_name
}