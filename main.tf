# Call the kube-prometheus child module
module "kube-prometheus" {
  source = "./Monitoring/modules/kube-prometheus"
  kube-version = "36.2.0"
}

# Define resources
resource "kubectl_manifest" "app" {
    yaml_body = file("./Deployment.yml")

}


