# (opcional) garantir que kube-system exista
# resource "kubernetes_namespace" "kube_system" {
#   metadata {
#     name = "kube-system"
#   }
# }

resource "kubernetes_deployment" "metrics_server" {
  metadata {
    name      = "metrics-server"
    namespace = "kube-system"
    labels = {
      k8s-app = "metrics-server"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        k8s-app = "metrics-server"
      }
    }

    template {
      metadata {
        labels = {
          k8s-app = "metrics-server"
        }
      }

      spec {
        container {
          name  = "metrics-server"
          image = "k8s.gcr.io/metrics-server/metrics-server:${var.metrics_server_version}"

          args = [
            "--cert-dir=/tmp",
            "--secure-port=4443",
            "--kubelet-insecure-tls",
            "--kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname",
            "--kubelet-use-node-status-port"
          ]

          port {
            container_port = 4443
            name           = "https"
          }

          volume_mount {
            name       = "tmp-dir"
            mount_path = "/tmp"
          }
        }

        volume {
          name = "tmp-dir"
          empty_dir {}
        }
      }
    }
  }
}

resource "kubernetes_service" "metrics_server" {
  metadata {
    name      = "metrics-server"
    namespace = "kube-system"
  }

  spec {
    selector = {
      k8s-app = "metrics-server"
    }

    port {
      port        = 443
      target_port = 4443
    }

    type = "ClusterIP"
  }
}
