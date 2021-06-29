variable "network_name" {
  type    = string
  default = "simple-gcp"
}

variable "admin_project" {
  type = string
}

variable "region" {
  type = string
}

variable "target_project_name" {
  type    = string
  default = "gcp-project-june-2021"
}

variable "domain" {
  type = string
}

variable "billing_account_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "org_id" {
  type = string
}

variable "prefix" {
  default = "dev"
}

variable "function_location" {
}

output "cloud_function_url" {
  value = google_cloudfunctions_function.web_app.https_trigger_url
}
