# Переменная для хранения имен пользователей, которым предоставляется
# доступ к чтению информации о подах (в рамках RBAC)
variable "pods_reader_users" {
  type = list(any)
  # sensitive = true
}

# Переменная для хранения названия namespace
variable "namespace" {
  type = string
}
