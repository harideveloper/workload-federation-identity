variable "project" {
  type        = string
  description = "GCP Prpject Name for Enablers Team"
  default = "hariprasad-sundaresan-0202"
}

variable "region" {
  type = string
  description = "The primary region provision resources within."
  default = "europe-west2"
}

variable "zone" {
  type = string
  description = "The primary zone to provision resources within."
  default = "europe-west2-b"
}

variable "github_url" {
  type    = string
  default = "https://github.com"
}

variable "github_repo" {
  type    = string
  default = "harideveloper/workload-federation-identity"
}


