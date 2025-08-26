resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = var.eks_cluster_role_arn
  version  = var.kubernetes_version

  vpc_config {
    subnet_ids = var.private_subnet_ids
    endpoint_public_access = true
    public_access_cidrs     = ["0.0.0.0/0"]
  }

  # Habilitar logs do control plane (ajuste conforme necessidade)
#   enabled_cluster_log_types = ["api", "audit", "authenticator"]

  tags = {
    Name = var.cluster_name
  }
}

# Criar OIDC provider para IRSA (usado para ServiceAccounts -> IAM Roles)
resource "aws_iam_openid_connect_provider" "eks" {
  url = aws_eks_cluster.eks.identity[0].oidc[0].issuer

  client_id_list = ["sts.amazonaws.com"]
}
