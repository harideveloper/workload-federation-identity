
resource "google_service_account" "wif_resource" {
  account_id = "wif-resource"
  display_name = "Terraform Resource created by Git Actions Using Workload Identity Auth"
}