variable "vpc_cidr" {
  description = "CIDR da VPC"
  type        = string
}

variable "public_subnets" {
  description = "CIDR para as subnets públicas"
  type        = list(string)
}

variable "private_subnets" {
  description = "CIDR para as subnets privadas"
  type        = list(string)
}

variable "availability_zones" {
  description = "Lista de zonas de disponibilidade"
  type        = list(string)
}

variable "enable_dns_support" {
  description = "Habilita suporte a DNS na VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Habilita hostnames DNS na VPC"
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
  default     = "eks-cluster"
  
}