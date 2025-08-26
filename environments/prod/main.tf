
module "vpc" {
  source = "../../modules/vpc"
  private_subnets = var.private_subnets
  vpc_cidr = var.vpc_cidr
  public_subnets = var.public_subnets
  availability_zones = var.availability_zones
}

module "iam" {
  source = "../../modules/iam"
  cluster_name = var.cluster_name
}

module "eks" {
  source = "../../modules/eks"
  cluster_name = var.cluster_name
  kubernetes_version = var.kubernetes_version
  eks_cluster_role_arn = module.iam.iam_role_arn
  vpc_id = module.vpc.vpc_id
  private_subnet_ids = concat(module.vpc.private_subnet_ids, module.vpc.public_subnet_ids)
}

module "node_groups" {
  source = "../../modules/node_groups"
  cluster_name = var.cluster_name
  node_group_role_arn = module.iam.node_group_role_arn
  subnet_ids = concat(module.vpc.private_subnet_ids, module.vpc.public_subnet_ids)
  instance_type = var.instance_type
  desired_capacity = var.desired_capacity
  max_size = var.max_size
  min_size = var.min_size
  depends_on = [ module.eks ]
}

module "addons" {
  source = "../../modules/addons"

  cluster_name = module.eks.cluster_name
  cert_manager_version = var.cert_manager_version
  aws_lb_controller_version = var.aws_lb_controller_version
  cluster_autoscaler_version = var.cluster_autoscaler_version
  metrics_server_version = var.metrics_server_version
  cluster_ca_certificate = module.eks.cluster_certificate_authority_data
  cluster_endpoint = module.eks.cluster_endpoint

  providers = {
    kubernetes = kubernetes
    helm       = helm
  }
}

# module "datadog" {
#   source = "../../modules/datadog"
#   datadog_api_key = var.datadog_api_key
#   datadog_app_key = var.datadog_app_key
# }