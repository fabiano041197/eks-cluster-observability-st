variable "cluster_name" {
  description = "O nome do cluster EKS."
  type        = string
}

variable "aws_region" {
  description = "A região da AWS onde os recursos serão criados."
  type        = string
}

variable "instance_type" {
  description = "O tipo de instância para o grupo de nós do EKS."
  type        = string
  default     = "t3.medium"
}

variable "desired_capacity" {
  description = "O número desejado de nós no grupo de nós do EKS."
  type        = number
  default     = 2
}

variable "max_size" {
  description = "O número máximo de nós no grupo de nós do EKS."
  type        = number
  default     = 3
}

variable "min_size" {
  description = "O número mínimo de nós no grupo de nós do EKS."
  type        = number
  default     = 1
}

variable "kubernetes_version" {
  description = "A versão do Kubernetes para o cluster EKS."
  type        = string
  default     = "1.21"
}

variable "tags" {
  description = "Um mapa de tags para atribuir aos recursos."
  type        = map(string)
  default     = {}
}

variable "vpc_cidr" {
  description = "O bloco CIDR para a VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  description = "Uma lista de blocos CIDR para as sub-redes."
  type        = list(string)
  
}

variable "availability_zones" {
  description = "Uma lista de zonas de disponibilidade para as sub-redes."
  type        = list(string)

}

variable "public_subnets" {
  description = "Uma lista de blocos CIDR para as sub-redes públicas."
  type        = list(string)
  
}

variable "private_subnets" {
  description = "Uma lista de blocos CIDR para as sub-redes privadas."
  type        = list(string)
  
}

variable "cert_manager_version" {
  description = "A versão do cert-manager a ser instalada."
  type        = string
  default     = "v1.7.1"
  
}

variable "aws_lb_controller_version" {
  description = "A versão do AWS Load Balancer Controller a ser instalada."
  type        = string
  default     = "v2.4.1"  
  
}

variable "cluster_autoscaler_version" {
  description = "A versão do Cluster Autoscaler a ser instalada."
  type        = string
  default     = "v1.21.0"
  
}

variable "metrics_server_version" {
  description = "A versão do Metrics Server a ser instalada."
  type        = string
  default     = "v0.5.0"
  
}

variable "datadog_api_key" {
  description = "A chave de API para a integração com o Datadog."
  type        = string
}

variable "datadog_app_key" {
  description = "A chave de APP para a integração com o Datadog."
  type        = string    
}