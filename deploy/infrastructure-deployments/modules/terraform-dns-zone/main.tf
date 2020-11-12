data "google_compute_network" "automl-network" {
    project = var.project
    name    = var.network
}

resource "google_dns_managed_zone" "automl-prive-zone" {
    project     = var.project
    name        = var.name
    dns_name    = var.dns_name
    description = "Private DNS Zone for AutoML Labeling Tool instance"

    visibility = "private"

    private_visibility_config { 
        networks {
            network_url = data.google_compute_network.automl-network.id
        }
    }
}