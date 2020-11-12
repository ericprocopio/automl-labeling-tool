resource google_service_account "automl_service_account" {
     project        = var.project_id
     account_id     = "automl-service-account"
     display_name   = "automl-service-account"
 }

resource "google_project_iam_member" "automl_predictor" {
  project = var.project_id
  role    = "roles/automl.predictor"
  member  = "serviceAccount:${google_service_account.automl_service_account.email}"
}

resource "google_project_iam_member" "automl_viewer" {
  project = var.project_id
  role    = "roles/automl.viewer"
  member  = "serviceAccount:${google_service_account.automl_service_account.email}"
}

resource "google_project_iam_member" "storage_objectAdmin" {
  project = var.project_id
  role    = "roles/storage.objectAdmin"
  member  = "serviceAccount:${google_service_account.automl_service_account.email}"
}