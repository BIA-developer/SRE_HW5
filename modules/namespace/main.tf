terraform {
  required_version = ">= 1.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~>2.35.1"
    }
  }
}

resource "kubernetes_namespace" "flask_app_namespace" {
  metadata {
    annotations = {
      name = "flask_app_namespace_annotation"
    }

    labels = {
      app_label = "flask"
    }

    name = var.flask_app_namespace
  }
}
