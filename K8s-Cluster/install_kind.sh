#!/bin/bash

# Author: kevin Omini
# Date: Sep 18, 2023
# Desc: this is a shell script that deploys kind cluster locally on Linux
# documentation on https://kind.sigs.k8s.io/docs/user/quick-start/#installation


# checks the harwared of my system to download the required binaries 
# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64

# For ARM64
[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-arm64


# Make kind to be executable 
chmod +x ./kind

# Move kind to the system binaries 
sudo mv ./kind /usr/local/bin/kind

# Create a k8s Cluster 
sudo kind create cluster

# Copy and save Kubeconfig in ~/.kube/config