terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

# Workload Identity
resource "random_id" "random" {
  byte_length = 4
}

resource "google_iam_workload_identity_pool" "github_pool" {
  workload_identity_pool_id = "github-pool-${random_id.random.hex}"
  project = var.project
}


resource "google_iam_workload_identity_pool_provider" "github_pool_provider" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-pool-provider-${random_id.random.hex}"
  project = var.project
  attribute_mapping = {  
    "google.subject"           = "assertion.sub", 
    "attribute.actor"          = "assertion.actor",
    "attribute.repository"     = "assertion.repository",
    "attribute.aud"            = "assertion.aud",
  }
  oidc {
    issuer_uri        = "https://token.actions.githubusercontent.com"
  }
}


resource "google_service_account" "github_sa" {
  account_id = "github-sa"
  display_name = "Service account for GitHub actions"
}

# IAM Service Account Binding
resource "google_service_account_iam_binding" "github-sa-roles" {
  service_account_id = google_service_account.github_sa.name

  role                  = "roles/iam.workloadIdentityUser"
  members = [
    "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_pool.name}/attribute.repository/${var.github_repo}"
  ]
}


# Grant the service account token creator role
resource "google_project_iam_binding" "github_sa_project_roles" {
  project = var.project
  role    = "roles/iam.serviceAccountTokenCreator"
  members = [
    "serviceAccount:${google_service_account.github_sa.email}"
  ]
}

# Grant the service account token creator role
resource "google_project_iam_binding" "github_sa_user_roles" {
  project = var.project
  role    = "roles/iam.serviceAccountAdmin"
  members = [
    "serviceAccount:${google_service_account.github_sa.email}"
  ]
}


output "PROVIDER_NAME" {
  value = google_iam_workload_identity_pool_provider.github_pool_provider.name
}

output "POOL_NAME" {
  value = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
}

output "SERVICE_ACCOUNT" {
  value = google_service_account.github_sa.email
}