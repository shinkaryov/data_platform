resource "kubernetes_secret" "postgresql_connection_secrets" {
  metadata {
    namespace = "group-7"
    name      = "db-connection-secrets"
  }
  data = {
    username = aws_ssm_parameter.postgresql_username.value
    password = data.aws_ssm_parameter.postgresql_password.value
    endpoint = aws_ssm_parameter.postgresql_endpoint.value
    db_name  = aws_ssm_parameter.postgresql_db_name.value
    api_db_name = aws_ssm_parameter.postgresql_api_db_name.value
  }
}