variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
  default     = "eks-cluster"

}

variable "kubernetes_version" {
  description = "Versão do Kubernetes para o cluster EKS"
  type        = string
  default     = "1.23"
  
}

variable "eks_cluster_role_arn" {
  description = "ARN da role IAM para o cluster EKS"
  type        = string
  
}

variable "private_subnet_ids" {
  description = "IDs das subnets privadas"
  type        = list(string)
  
}

variable "vpc_id" {
  description = "ID da VPC"
  type        = string
  
}