#!/bin/bash

#============================================================================
# Author: Kevin Omini
# Date: Sep 18, 2023
# Description: This is a shell script that deploys a kind cluster locally on Linux
# Documentation: https://kind.sigs.k8s.io/docs/user/quick-start/#installation
#============================================================================

# Define ENVs
CLUSTER_NAME="task"

# Function to check if Kind is installed
check_kind() {
  if ! command -v kind &> /dev/null; then
    echo "Kind is not installed. Downloading and installing..."
    # For AMD64 / x86_64
    [ "$(uname -m)" = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64

    # For ARM64
    [ "$(uname -m)"  = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-arm64

    # Make kind executable
    chmod +x ./kind

    # Move kind to the system binaries
    sudo mv ./kind /usr/local/bin/kind
    
    echo "Kind installation completed."
  else
    echo "Kind is already installed."
  fi
}

# Check if Kind is installed
check_kind

# Create a Kubernetes Cluster using Kind
sudo kind create cluster --name "$CLUSTER_NAME"

# Wait for the cluster to be ready
kubectl wait --for=condition=Ready nodes --all --timeout=3m

# Display cluster information
kubectl cluster-info

echo "kubeconfig saved to ~/.kube/config"