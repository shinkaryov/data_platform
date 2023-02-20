data "tls_certificate" "pmacademy" {
  url = aws_eks_cluster.pmacademy.identity.0.oidc.0.issuer
}

resource "aws_iam_openid_connect_provider" "pmacademy" {
  client_id_list = ["sts.amazonaws.com"]
  thumbprint_list = [
    "9e99a48a9960b14926bb7f3b02e22da2b0ab7280",
    "06b25927c42a721631c1efd9431e648fa62e1e39",
    "917e732d330f9a12404f73d8bea36948b929dffc",
    "45f6cbedec2f49c9bedbd525d012b2b8137164d8",
  ]
  url = aws_eks_cluster.pmacademy.identity.0.oidc.0.issuer

  tags = {
    "Example"    = "pmacademy"
    "GithubOrg"  = "terraform-aws-modules"
    "GithubRepo" = "terraform-aws-eks"
    "Name"       = "pmacademy-eks-irsa"
  }

}