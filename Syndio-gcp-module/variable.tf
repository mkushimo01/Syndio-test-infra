#variables set
variable "project_id" {
  description = "Syndio-test-app project ID"
  type        = string
  default    = "syndio-test-app-project"
}

variable "region" {
  description = "Region for the GKE cluster"
  type        = string
  default     = "us-central1"
}