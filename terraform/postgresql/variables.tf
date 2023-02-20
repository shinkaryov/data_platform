variable "env" {
  description = "Environment"
  type        = string
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-central-1"
}

variable "is_temporary" {
  description = "Set to true if this resource created temporary and should be removed after var.delete_after"
  type        = bool
  default     = false
}

variable "delete_after" {
  description = "Last day of resource existing if is_temporary == true. Format dd.mm.yyyy. If resource is not temporary, then default values is valid (-)"
  type        = string
  default     = "-"
}

variable "tags" {
  description = "Default tag for AWS provider"
  type        = map(string)
  default = {
    "Project"   = "postgresql"
    "Team"      = "group7"
    "Terraform" = "true"
  }
}

variable "vpc_cidr_block" {
  description = "VPC CIDR"
  default     = "10.0.0.0/16"
}

variable "postgresql_username" {
  description = "Username for PostgreSQL RDS"
  default     = "postgres"
}

variable "rds_identifier" {
  description = "Default identifier for PostgreSQL RDS"
  default     = "postgresql-rds-group7"
}

variable "db_name" {
  description = "Default name for PostgreSQL RDS DB"
  default     = "postgresdb"
}

variable "api_db_name" {
  description = "Default name for PostgreSQL RDS DB for airflow"
  default     = "sales"
}

variable "subnet_ids" {
  description = "Private subnet ids fro rds instance"
  default     = ["subnet-0ebf606fa76f66751", "subnet-01d782adcf5a9762f", "subnet-09b0ce7faeeb4c648"]
}

variable "vpc_tags" {
  description = "Tags of VPC, that was that was already created"
  type        = map(string)
  default = {
    "Example"    = "pmacademy"
    "GithubOrg"  = "terraform-aws-modules"
    "GithubRepo" = "terraform-aws-eks"
    "Name"       = "pmacademy"
  }
}
