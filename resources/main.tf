
resource "google_service_account" "workload_test_sa" {
  account_id = "workload_test_sa"
  display_name = "Terraform Resource created by Git Actions Using Workload Identity Auth"
}