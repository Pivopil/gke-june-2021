provider "google" {
  region  = var.region
  project = var.admin_project
}

provider "null" {
}

provider "random" {
}
