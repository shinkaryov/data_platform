resource "aws_security_group" "postgres_rds_sg" {
  name        = "postgres_rds_sg_group7"
  description = "Security group for PostgreSQL RDS instance"
  vpc_id      = aws_vpc.pmacademy.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.pmacademy.cidr_block]
  }

  tags = var.tags
}

data "aws_ssm_parameter" "postgresql_password" {
  name       = "postgresql_password_group7"
  depends_on = [aws_ssm_parameter.postgresql_password]
}

resource "aws_db_instance" "postgres_rds" {
  engine         = "postgres"
  engine_version = "14.6"
  instance_class = "db.t3.micro"
  identifier     = var.rds_identifier
  db_name        = var.db_name
  username       = var.postgresql_username
  password       = data.aws_ssm_parameter.postgresql_password.value

  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.postgres_rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.subnet_group.name

  port = 5432

  storage_type          = "gp3"
  allocated_storage     = 20
  max_allocated_storage = 40
}
