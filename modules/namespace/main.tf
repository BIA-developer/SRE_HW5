terraform {
  required_version = ">= 1.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~>2.35.1"
    }
  }
}

resource "kubernetes_namespace" "new_namespace" {
  metadata {
    annotations = {
      name = "flask_app_namespace_annotation"
    }

    labels = {
      app_label = "flask"
    }

    name = var.new_namespace
  }
}
