variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
  default     = "eks-cluster"
  
}

variable "desired_capacity" {
  description = "Número desejado de nós no grupo de nós EKS"
  type        = number
  default     = 2
  
}

variable "min_size" {
  description = "Número mínimo de nós no grupo de nós EKS"
  type        = number
  default     = 1
  
}

variable "max_size" {
  description = "Número máximo de nós no grupo de nós EKS"
  type        = number
  default     = 3
  
}

variable "instance_type" {
  description = "Tipo de instância para o grupo de nós EKS"
  type        = string
  default     = "t3.medium"
  
}

variable "node_group_role_arn" {
  description = "ARN da role IAM para o grupo de nós EKS"
  type        = string  
  
}

variable "subnet_ids" {
  description = "IDs das subnets onde o grupo de nós será criado"
  type        = list(string)  
  
}