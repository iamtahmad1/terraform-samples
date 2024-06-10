variable "credentials_file" {
  description = "Path to the service account credentials file"
  type        = string
}

variable "project_id" {
  description = "The ID of the project in which to create the GKE cluster"
  type        = string
}

variable "region" {
  description = "The region in which to create the GKE cluster"
  type        = string
  default     = "us-central1"
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
  default     = "primary-cluster"
}

variable "initial_node_count" {
  description = "The initial number of nodes in the cluster"
  type        = number
  default     = 3
}

variable "node_machine_type" {
  description = "The type of machine to use for nodes"
  type        = string
  default     = "e2-medium"
}

variable "cluster_version" {
  description = "The Kubernetes version for the GKE cluster"
  type        = string
  default     = "1.21.6-gke.1500"
}

variable "disk_size_gb" {
  description = "The disk size in GB for each node in the cluster"
  type        = number
  default     = 100  # Default disk size
}