data "google_compute_network" "vpc_network" {
    project                 = var.project
    name                    = var.vpc_name
}

resource "google_compute_subnetwork" "ilb_proxy" {
    provider        = google-beta
    project         = var.project
    name            = var.subnet_name
    ip_cidr_range   = var.cidr_range
    region          = var.subnet_region
    network         = data.google_compute_network.vpc_network.self_link
    purpose         = "INTERNAL_HTTPS_LOAD_BALANCER"
    role            = "ACTIVE"
}

resource "google_compute_firewall" "allow_tcp_to_proxy" {
    provider        = google-beta
    project         = var.project
    name            = "allow-tcp-to-proxy"
    network         = data.google_compute_network.vpc_network.self_link
    source_ranges   = [google_compute_subnetwork.ilb_proxy.ip_cidr_range]
    target_tags     = ["load-balanced-backend"]
    allow {
        protocol    = "tcp"
        ports       = ["80"]
    }
    allow {
        protocol    = "tcp"
        ports       = ["443"]
    }
    allow {
        protocol    = "tcp"
        ports       = ["8080"]
    }
    direction       = "INGRESS"
}
