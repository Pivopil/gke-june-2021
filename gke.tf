//resource "google_container_cluster" "primary" {
//  project = google_project.project.project_id
//  name = "${var.prefix}-${var.name}"
//  location = var.location
//  remove_default_node_pool = true
//  initial_node_count = 1
//}
//
//resource "google_container_node_pool" "primary-pool" {
//  project = google_project.project.project_id
//  cluster = google_container_cluster.primary.name
//  name = "${var.prefix}-${var.name}-primary-pool"
//  location = var.location
//  node_count = 2
//  node_config {
//    preemptible = true
//    machine_type = "n1-standart-2"
//    oauth_scopes = [
//      "https://www.googleapis.com/auth/logging.write",
//      "https://www.googleapis.com/auth/monitoring"
//    ]
//  }
//  autoscaling {
//    max_node_count = 3
//    min_node_count = 0
//  }
//  management {
//    auto_repair = true
//    auto_upgrade = true
//  }
//}
