# Introduction
In this project, we will create a Kubernetes cluster using Docker and [Kind](https://kind.sigs.k8s.io/), Dockerize a [Node.js App](https://expressjs.com/en/starter/hello-world.html), and deploy it to the Kubernetes cluster using the [kubectl Terraform provider](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs). We will also implement infrastructure monitoring and observability for the cluster using the [Kube-Prometheus Stack](https://github.com/prometheus-community/helm-charts/blob/main/charts/kube-prometheus-stack/README.md) and the [Terraform Helm provider](https://registry.terraform.io/providers/hashicorp/helm/latest/docs).

### Technologies

- [Docker](https://docs.docker.com/engine/)
- [Kubernetes](https://kubernetes.io/docs/home/)
- [Kind](https://kind.sigs.k8s.io/)
- [Kubectl](https://kubernetes.io/docs/reference/kubectl/)
- [Terraform](https://developer.hashicorp.com/terraform?product_intent=terraform)
- [Helm Chart](https://helm.sh/docs/)
- [Git](https://git-scm.com/doc)


### Task I: Setting Up the Kubernetes Cluster

To set up a Kubernetes cluster using Kind, follow these steps:

1.  Install [Docker](https://docs.docker.com/engine/install/ubuntu/) and [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-kubectl-binary-with-curl-on-linux) on your machine
2. Make the bash script executable for installing Kind:
```chmod +x install_kind.sh```

3. Download and save the kubeconfig for the cluster as it will be used later to authenticate into the cluster by Terraform

### Task II: Deploying the Node.js App to Kubernetes

To deploy the Node.js App to the Kubernetes cluster created in Task I, follow these steps:
1.  Log in to your [DockerHub](https://hub.docker.com/) account
2. Dockerize the application by creating a Dockerfile in the application root directory
3. Build and push the application image by running the following commands in the root directory of your project:
```
	docker build . -t username/imageName:tag
	docker push username/imageName:tag
```
4. Create a deployment manifest
5. Install Terraform and Terraform extension in IDE for easy debugging
6. In the root directory, run the following commands:
```
	terraform init 
	terraform plan
	terraform apply
```

### Task III: Deploying the Monitoring Stack to the Kubernetes Cluster
After creating the Kube-prometheus module, run the Terraform commands from Task II again to deploy the Kube-prometheus stack for monitoring and observability

