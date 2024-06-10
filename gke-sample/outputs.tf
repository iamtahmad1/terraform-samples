output "endpoint" {
  description = "The endpoint of the GKE cluster"
  value       = google_container_cluster.primary.endpoint
}

output "cluster_name" {
  description = "The name of the GKE cluster"
  value       = google_container_cluster.primary.name
}

output "client_certificate" {
  description = "The client certificate for accessing the GKE cluster"
  value       = google_container_cluster.primary.master_auth.0.client_certificate
  sensitive   = true
}

output "client_key" {
  description = "The client key for accessing the GKE cluster"
  value       = google_container_cluster.primary.master_auth.0.client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "The CA certificate for the GKE cluster"
  value       = google_container_cluster.primary.master_auth.0.cluster_ca_certificate
  sensitive   = true
}

output "kubeconfig" {
  value = <<EOF
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: ${base64encode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)}
    server: https://${google_container_cluster.primary.endpoint}
  name: ${google_container_cluster.primary.name}
contexts:
- context:
    cluster: ${google_container_cluster.primary.name}
    user: ${google_container_cluster.primary.name}
  name: ${google_container_cluster.primary.name}
current-context: ${google_container_cluster.primary.name}
kind: Config
preferences: {}
users:
- name: ${google_container_cluster.primary.name}
  user:
    client-certificate-data: ${base64encode(google_container_cluster.primary.master_auth[0].client_certificate)}
    client-key-data: ${base64encode(google_container_cluster.primary.master_auth[0].client_key)}
EOF
}