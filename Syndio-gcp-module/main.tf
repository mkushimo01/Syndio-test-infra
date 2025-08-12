terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.4" # recent provider version used
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "syndio_test-app" {
  source = "../syndio-module"

  project_id          = var.project_id
  region              = var.region
  vpc_name            = "syndio-test-app-vpc"
  subnet_name         = "syndio-test-app-subnet"
  subnet_cidr         = "10.10.0.0/24"
  pods_range_name     = "syndio-test-app-pods-range"
  pods_cidr           = "10.20.0.0/16"
  services_range_name = "syndio-test-app-services-range"
  services_cidr       = "10.30.0.0/20"
  allowed_cidr_blocks = ["0.0.0.0/0"] # Allow all for testing purposes
  cluster_name        = "syndio-test-app-cluster"
  node_count          = 3
  node_machine_type   = "e2-standard-4"
  node_disk_gb        = 100
}
