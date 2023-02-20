data "aws_iam_role" "AWSServiceRoleForAmazonEKS" {
  name = "AWSServiceRoleForAmazonEKS"
}


resource "aws_eks_cluster" "pmacademy" {
  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
  ]
  name     = "pmacademy"
  role_arn = "arn:aws:iam::935764478194:role/pmacademy-cluster-20230128092012755600000002"
  tags = {
    "Example"    = "pmacademy"
    "GithubOrg"  = "terraform-aws-modules"
    "GithubRepo" = "terraform-aws-eks"
  }
  tags_all = {
    "Example"    = "pmacademy"
    "GithubOrg"  = "terraform-aws-modules"
    "GithubRepo" = "terraform-aws-eks"
  }
  version = "1.24"

  encryption_config {
    resources = [
      "secrets",
    ]

    provider {
      key_arn = "arn:aws:kms:eu-central-1:935764478194:key/3e29b028-71a9-4084-8faf-5fbd88dd8fe2"
    }
  }

  kubernetes_network_config {
    ip_family         = "ipv4"
    service_ipv4_cidr = "172.20.0.0/16"
  }

  timeouts {}

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = true
    public_access_cidrs = [
      "0.0.0.0/0",
    ]
    security_group_ids = [
      "sg-0c56833b4658db7ea",
    ]
    subnet_ids = [
      "subnet-0569d515838b71977",
      "subnet-06d08e31b8c4bdcf3",
      "subnet-0b80bc1bae12a99ae",
    ]
  }
}
