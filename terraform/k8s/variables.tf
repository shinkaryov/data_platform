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
    "Project"   = "k8s"
    "Team"      = "group7"
    "Terraform" = "true"
  }
}

variable "AmazonEKSClusterPolicy_arn" {
  description = "Environment"
  type        = string
  default     = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

variable "AmazonEKSWorkerNodePolicy_arn" {
  description = "Environment"
  type        = string
  default     = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

variable "AmazonS3FullAccess_arn" {
  description = "Environment"
  type        = string
  default     = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

variable "AmazonDynamoDBFullAccess_arn" {
  description = "Environment"
  type        = string
  default     = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

variable "AdministratorAccess_arn" {
  description = "Environment"
  type        = string
  default     = "arn:aws:iam::aws:policy/AdministratorAccess"
}