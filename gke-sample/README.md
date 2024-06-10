# Terraform GKE Cluster

This repository contains Terraform configuration files to create a Google Kubernetes Engine (GKE) cluster in a specified region using Google Cloud Platform (GCP).

## Prerequisites

Before you begin, ensure you have the following installed on your local machine:

1. [Terraform](https://www.terraform.io/downloads.html) (v0.14+)
2. [Google Cloud SDK (gcloud)](https://cloud.google.com/sdk/install)
3. A Google Cloud Project with the GKE API enabled

## Setup Instructions

### 1. Clone the Repository

Clone this repository to your local machine:


git clone <repository-url>
cd terraform-gke

### 2. Configure GCloud SDK

gcloud auth login
gcloud auth application-default login
gcloud config set project YOUR_PROJECT_ID
gcloud iam service-accounts create terraform --display-name "Terraform admin account"

gcloud projects add-iam-policy-binding YOUR_PROJECT_ID \
  --member serviceAccount:terraform@YOUR_PROJECT_ID.iam.gserviceaccount.com \
  --role roles/container.admin

gcloud iam service-accounts keys create ~/path/to/your/terraform-key.json \
  --iam-account terraform@YOUR_PROJECT_ID.iam.gserviceaccount.com

### 3. Configure Update tfvars file or export variables
export TF_VAR_credentials_file="~/path/to/your/terraform-key.json"
export TF_VAR_project_id="YOUR_PROJECT_ID"
export TF_VAR_region="asia-southeast1"  # Example region: Singapore
export TF_VAR_cluster_name="primary-cluster"
export TF_VAR_initial_node_count=3
export TF_VAR_node_machine_type="e2-medium"
export TF_VAR_cluster_version="1.21.

### 4. All set
terraform init
terraform validate
terraform plan
terraform apply

# 5. Retrieve Kube Credentials
terraform output kubeconfig > kubeconfig.yaml
export KUBECONFIG=kubeconfig.yaml
kubectl get nodes
