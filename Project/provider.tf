provider "google" {
  credentials = file("/Users/louischang/mykeys/onyx-sign-417920-1d5891737b43.json")
  project     = "onyx-sign-417920"
  region      = "us-central1"
  zone        = "us-central1-a"
}

provider "kubernetes" {
  #load_config_file       = false
  host                   = "https://${google_container_cluster.main_gke_cluster.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.main_gke_cluster.master_auth[0].cluster_ca_certificate)
}

data "google_client_config" "default" {}