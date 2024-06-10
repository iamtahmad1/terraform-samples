provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = var.region
}

resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  location           = var.region
  initial_node_count = 1  # Set to 1 as we are removing the default node pool
  min_master_version = var.cluster_version

  remove_default_node_pool = true

  node_config {
    machine_type = var.node_machine_type
    disk_size_gb = var.disk_size_gb
  }
}

resource "google_container_node_pool" "primary_nodes" {
  cluster    = google_container_cluster.primary.name
  location   = var.region
  name       = "primary-node-pool"
  node_count = var.initial_node_count

  node_config {
    machine_type = var.node_machine_type
    disk_size_gb = var.disk_size_gb
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
  }

  lifecycle {
    ignore_changes = [node_count]
  }
}


