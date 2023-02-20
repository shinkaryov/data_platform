resource "aws_vpc" "pmacademy" {
  cidr_block = var.vpc_cidr_block

  tags = var.vpc_tags
}

resource "aws_db_subnet_group" "subnet_group" {
  name       = "db_subnet_group_group7"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "Amazon RDS PostgreSQL DB subnet group"
  }
}
