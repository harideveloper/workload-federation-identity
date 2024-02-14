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
