terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 3.0.2"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.11.0" # importante para ter o kubernetes_manifest
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 3.0"
    }

    datadog = {
      source = "DataDog/datadog"
    }
  }
}
