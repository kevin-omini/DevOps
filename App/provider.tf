# Define providers
terraform {
  required_version = ">= 0.13"

  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}


# For authentication, the Helm provider can get its configuration by supplying a path to your kubeconfig file.
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

# Used to interact with the resources supported by Kubernetes.
# The provider needs to be configured with the proper credentials before it can be used.
provider "kubernetes" {
  config_path = "~/.kube/config" #pathexpand(var.kube_config)
}