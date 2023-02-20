resource "aws_ssm_parameter" "postgresql_password" {
  name  = "postgresql_password_group7"
  type  = "SecureString"
  value = ""

}

data "aws_ssm_parameter" "postgresql_password" {
  name       = "postgresql_password_group7"
  depends_on = [aws_ssm_parameter.postgresql_password]
}

resource "aws_ssm_parameter" "postgresql_username" {
  name  = "postgresql_username_group7"
  type  = "String"
  value = ""
}

resource "aws_ssm_parameter" "postgresql_endpoint" {
  name  = "postgresql_endpoint_group7"
  type  = "String"
  value = ""
}

resource "aws_ssm_parameter" "postgresql_db_name" {
  name  = "postgresql_db_name_group7"
  type  = "String"
  value = ""
}

resource "aws_ssm_parameter" "postgresql_api_db_name" {
  name  = "postgresql_api_db_name_group7"
  type  = "String"
  value = ""
}