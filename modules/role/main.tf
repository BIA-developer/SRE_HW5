terraform {
  required_version = ">= 1.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~>2.35.1"
    }
  }
}

resource "kubernetes_role" "pods_reader" {
  metadata {
    name = "flask_pods_reader_role"
    labels = {
      role_label = "pods_reader"
    }
    namespace = var.namespace
  }

  rule {
    api_groups = [""]
    resources  = ["pods"]
    verbs      = ["get", "list", "watch"]
  }
}

resource "kubernetes_role_binding" "pods_reader_bindings" {
  count = length(var.pods_reader_users)
  metadata {
    name      = "pods_reader_role_bindings-${count.index}"
    namespace = var.namespace
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = resource.kubernetes_role.pods_reader.metadata[0].name
  }
  subject {
    kind      = "User"
    name      = var.pods_reader_users[count.index]
    api_group = "rbac.authorization.k8s.io"
  }
}
