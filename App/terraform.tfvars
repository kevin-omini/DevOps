# define the image tag for versioning of your application
image_tag = "1.0.0-light"

# calling the kube child module
module "kube" {
  source = "./modules/kube-prometheus"
  kube-version = "36.2.0"
}