variable "cert_manager_version" {
  description = "A versão do Cert Manager a ser implantada"
  type        = string
  default     = "v1.5.3"
}

variable "aws_lb_controller_version" {
  description = "A versão do AWS Load Balancer Controller a ser implantada"
  type        = string
  default     = "v2.3.1"
}

variable "cluster_autoscaler_version" {
  description = "A versão do Cluster Autoscaler a ser implantada"
  type        = string
  default     = "v1.21.0"
}

variable "metrics_server_version" {
  description = "A versão do Metrics Server a ser implantada"
  type        = string
  default     = "v0.5.0"
}

variable "enable_cert_manager" {
  description = "Habilita o addon Cert Manager"
  type        = bool
  default     = true
}

variable "enable_aws_lb_controller" {
  description = "Habilita o addon AWS Load Balancer Controller"
  type        = bool
  default     = true
}

variable "enable_cluster_autoscaler" {
  description = "Habilita o addon Cluster Autoscaler"
  type        = bool
  default     = true
}

variable "enable_metrics_server" {
  description = "Habilita o addon Metrics Server"
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "O nome do cluster EKS."
  type        = string
  
}

variable "aws_region" {
  description = "A região da AWS para criar os recursos."
  type        = string
  default     = "us-west-1"
  
}
variable "service_account_name" {
  description = "O nome da Service Account para o Cluster Autoscaler."
  type        = string
  default     = "cluster-autoscaler"
  
}

variable "prometheus_stack_version" {
  description = "A versão da Stack Prometheus a ser implantada."
  type        = string
  default     = "45.6.0"
  
}

variable "grafana_admin_password" {
  description = "A senha de administrador para o Grafana."
  type        = string
  sensitive   = true
  # O valor deve ser fornecido no arquivo .tfvars do ambiente.
}

variable "cluster_ca_certificate" {
  description = "Os dados do certificado codificado em base64 necessários para se comunicar com o cluster."
  type        = string
  
}

variable "cluster_endpoint" {
  description = "O endpoint para o cluster EKS."
  type        = string
  
}