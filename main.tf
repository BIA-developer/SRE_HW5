terraform {
  required_version = ">= 1.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~>2.35.1"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

module "namespace" {
  source        = "./modules/namespace"
  new_namespace = var.flask_app_namespace
}

module "role" {
  source            = "./modules/role"
  namespace         = var.flask_app_namespace
  pods_reader_users = var.pods_reader_users
}
