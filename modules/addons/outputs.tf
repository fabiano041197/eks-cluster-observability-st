output "addon_names" {
  value = [
    "cert-manager",
    "aws-load-balancer-controller",
    "cluster-autoscaler",
    "metrics-server"
  ]
}

# output "addon_statuses" {
#   value = {
#     cert_manager                = module.cert_manager.status
#     aws_lb_controller           = module.aws_lb_controller.status
#     cluster_autoscaler          = module.cluster_autoscaler.status
#     metrics_server              = module.metrics_server.status
#   }
# }