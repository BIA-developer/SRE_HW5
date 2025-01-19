# SRE_HW5
## Установка pre-commit хуков
- Установите `pre-commit`
- Выполните команду `pre-commit install`

## Инфорамция по Namespace
За название создаваемого `namespace` отвечает переменная `flask_app_namespace` (см. файл `terraform.tfvars`)

## Информация по RBAC
Списпок имен пользователей, которым необходимо предоставить доступ к чтению информации о подах в `namespace` `flask`-проекта, задается через
переменную `pods_reader_users` (см. файл `terraform.tfvars`).
