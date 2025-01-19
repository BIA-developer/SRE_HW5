variable "flask_app_namespace" {
  type = string
}

variable "pods_reader_users" {
  type = list(any)
  # sensitive = true
}
