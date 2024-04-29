variable "project_id" {
  default = "sandbox-400418" 
}

variable "region" {
  default = "us-central1"  
}

resource "google_service_account" "cluster_sa" {
  account_id = "sampleapp-cluster-sa" 
  display_name = "Sample App Cluster Service Account"
}


resource "google_project_iam_binding" "cluster_sa_binding" {
  project = var.project_id
  role    = "roles/container.clusterAdmin"  
  members = ["serviceAccount:${var.project_id}.iam.gserviceaccount.com:sampleapp-cluster-sa"]
}


resource "google_container_cluster" "primary" {
  name     = "sampleapp-cluster"
  location = var.region
  remove_default_node_pool = true
  initial_node_count      = 1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name      = "sampleapp-node-pool"
  location  = var.region
  cluster   = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible = true
    machine_type = "e2-medium"

    service_account = google_service_account.cluster_sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute", 
    ]
  }
}
