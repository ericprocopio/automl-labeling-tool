resource "google_compute_network" "vpc_network" {
    project                 = var.project
    name                    = var.vpc_name
    auto_create_subnetworks = false

}

resource "google_compute_subnetwork" "auto_ml_subnet" {
    project                     = var.project
    name                        = var.subnet_name
    ip_cidr_range               = var.cidr_range
    region                      = var.subnet_region
    network                     = google_compute_network.vpc_network.id
    private_ip_google_access    = true
}

resource "google_compute_firewall" "allow-tcp" {
    project            = var.project 
    name               = "automl-allow-tcp"
    network            = google_compute_network.vpc_network.name
    direction          = "INGRESS"

    allow {
        protocol = "tcp"
        ports    = ["80"]
    }

    source_tags = var.source_tags
}

resource "google_compute_firewall" "allow-iap-ssh" {
    project             = var.project
    name                = "automl-allow-iap-ssh"
    network             = google_compute_network.vpc_network.name
    direction           = "INGRESS"
    source_ranges       = ["35.235.240.0/20"]    

    allow {
        protocol = "tcp"
        ports    = ["22"]
    }
    
    source_tags = var.source_tags
}

resource "google_compute_firewall" "allow_health_check_probes" {
    provider        = google-beta
    project         = var.project
    name            = "allow-health-check-probes"
    network         = google_compute_network.vpc_network.self_link
    source_ranges   = ["130.211.0.0/22", "35.191.0.0/16"]
    allow {
        protocol = "tcp"
    }
    target_tags = ["load-balanced-backend"]
    direction   = "INGRESS"
}
