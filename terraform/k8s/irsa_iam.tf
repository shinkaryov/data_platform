locals {
  oidc_arn = aws_iam_openid_connect_provider.pmacademy.arn
  oidc_url = aws_iam_openid_connect_provider.pmacademy.url
  k8s_namespace = "group-7"
  k8s_service_account_name = "gitlab-runner"
}

resource "aws_iam_role" "k8s_irsa_role" {
  name                = "k8s-irsa-group-7"
  assume_role_policy  = data.aws_iam_policy_document.trust_k8s_irsa_role.json
}


data "aws_iam_policy_document" "trust_k8s_irsa_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = [local.oidc_arn]
    }
    condition {
      test     = "StringEquals"
      variable = "${replace(local.oidc_url, "https://", "")}:sub"
      values   = ["system:serviceaccount:${local.k8s_namespace}:${local.k8s_service_account_name}"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy-attach" {
  role       = aws_iam_role.k8s_irsa_role.name
  policy_arn = var.AmazonEKSClusterPolicy_arn
}

resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy-attach" {
  role       = aws_iam_role.k8s_irsa_role.name
  policy_arn = var.AmazonEKSWorkerNodePolicy_arn
}

resource "aws_iam_role_policy_attachment" "AmazonS3FullAccess-attach" {
  role       = aws_iam_role.k8s_irsa_role.name
  policy_arn = var.AmazonS3FullAccess_arn
}

resource "aws_iam_role_policy_attachment" "AmazonDynamoDBFullAccess-attach" {
  role       = aws_iam_role.k8s_irsa_role.name
  policy_arn = var.AmazonDynamoDBFullAccess_arn
}

resource "aws_iam_role_policy_attachment" "AdministratorAccess-attach" {
  role       = aws_iam_role.k8s_irsa_role.name
  policy_arn = var.AdministratorAccess_arn
}