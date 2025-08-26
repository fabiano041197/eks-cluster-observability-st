# resource "helm_release" "aws_lb_controller" {
#   name       = "aws-load-balancer-controller"
#   repository = "https://aws.github.io/eks-charts"
#   chart      = "aws-load-balancer-controller"
#   version    = var.aws_lb_controller_version
#   namespace  = "kube-system"

#   set = [
#     {
#     name  = "clusterName"
#     value = var.cluster_name
#     },  
#     {
#       name  = "serviceAccount.create"
#       value = "false"
#     },
#     {
#       name  = "serviceAccount.name"
#       value = "aws-load-balancer-controller"
#     }
#   ]
# }
