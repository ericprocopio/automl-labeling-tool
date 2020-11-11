data "google_compute_network" "automl_network" {
  project = var.project_id
  name    = var.network
}

data "google_compute_subnetwork" "automl_subnet" {
  project = var.project_id
  name    = var.subnet 
  region  = var.region
}

resource "google_compute_forwarding_rule" "automl_forwarding_rule" {
  provider    = google-beta
  depends_on  = [google_compute_subnetwork.proxy]
  
  project     = var.project_id
  name        = "automl-forwarding-rule"
  region      = var.region

  ip_protcol           = "TCP"
  load_balacing_scheme = "INTERNAL_MANAGED"
  port_range           = 80
  target               = google_compute_region_target_http_proxy.default.id
  network              = data.google_compute_network.automl_network.id
  subnetwork           = data.google_compute_subnetwork.automl_subnet.id
  network_tier         = "STANDARD"
}

resource "google_compute_region_target_http_proxy" "automl_proxy" {
  provider = google-beta

  region   = var.region
  name     = var.http_proxy_name
  url_map  = google_compute_region_url_map.automl_map.id
}

resource "google_compute_region_url_map" "automl_map" {
  provider = google-beta

  region          = var.region
  name            = var.url_nap_name
  default_service = google_compute_region_backend_service.automl_backend.id
}

resource "google_compute_region_backend_service" "automl_backend" {
  provider = google-beta

  load_balacing_scheme = "INTERNAL_MANAGED"

  backend {
    group = google_compute_region_instance_group_manager.automl_rigm.instance_group
    balancing_mode = "UTILIZATION"
    capacity_scaler = 1.0
  }

  region      = var.region
  name        = var.automl_backend
  protocol    = "HTTP"
  timeout_sec = 10

  health_checks = [google_compute_region_health_check.automl_healthcheck.id]
}
