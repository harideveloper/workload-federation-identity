variable "project" {
  type        = string
  description = "GCP Prpject Name for Enablers Team"
}

variable "region" {
  type = string
  description = "The primary region provision resources within."
}

variable "zone" {
  type = string
  description = "The primary zone to provision resources within."
}

variable "github_url" {
  type    = string
  description = "Version Control URI e.g <https://github.com>"
}

variable "github_repo" {
  type    = string
  description = "Respective Version Control Repo e.g <harideveloper/workload-federation-identity>"
}


