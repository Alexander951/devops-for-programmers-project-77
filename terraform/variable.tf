variable "vm_user" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "certificate_ids" {
  type = list(string)
}

variable "subdomain_name" {
  type = string
}

variable "db_name" {
  type      = string
  sensitive = true
}

variable "db_user" {
  type      = string
  sensitive = true
}

variable "db_password" {
  type      = string
  sensitive = true
}


variable "yc_token" {
  type      = string
  sensitive = true
}

variable "yc_cloud_id" {
  type      = string
  sensitive = true
}

variable "yc_folder_id" {
  type      = string
  sensitive = true
}

variable "compute_default_zone" {
  type      = string
  sensitive = true
}

variable "datadog_api_key" {
  type      = string
  sensitive = true
}

variable "datadog_app_key" {
  type      = string
  sensitive = true
}

variable "admin_ssh_key" {
  type      = string
  sensitive = true
}

variable "upmon_url" {
  type      = string
  sensitive = true
}
