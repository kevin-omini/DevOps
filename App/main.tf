# Define config variables
variable "image_tag" {}

# Define resources
resource "kubectl_manifest" "test" {
    yaml_body = <<YAML
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-world
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      name: web-app
  strategy:
    type: RollingUpdate
  template:
    metadata:
      labels:
        name: web-app
    spec:
      containers:
      - image: kevinomini/hello-world:${var.image_tag}
        name: hello-world
        resources:
          requests:
            memory: 250Mi
            cpu: 100m
          limits:
            memory: 512Mi
            cpu: 200m
        ports:
        - containerPort: 3000
          protocol: TCP

YAML
}


