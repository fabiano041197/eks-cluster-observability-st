output "cluster_name" {
  description = "Nome do cluster EKS"
  value       = aws_eks_cluster.eks.name
}

output "cluster_arn" {
  description = "ARN do cluster EKS"
  value       = aws_eks_cluster.eks.arn
}

output "cluster_endpoint" {
  description = "Endpoint do cluster Kubernetes"
  value       = aws_eks_cluster.eks.endpoint
}

output "cluster_certificate_authority_data" {
  description = "CA do cluster (base64)"
  value       = aws_eks_cluster.eks.certificate_authority[0].data
}

output "cluster_oidc_issuer" {
  description = "Issuer OIDC do cluster (pode estar vazio se não disponível)"
  value       = try(aws_eks_cluster.eks.identity[0].oidc[0].issuer, "")
}