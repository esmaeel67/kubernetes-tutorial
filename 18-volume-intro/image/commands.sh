cd image/

# Build the image
docker build -f Dockerfile -t esmaeil157-demo-app:v1 .

# Load the image into the K8s cluster
# Replace <YOUR_CLUSTER_NAME> with your kind cluster name (kind get clusters)
kind load docker-image esmaeil157-demo-app:v1 --name volume-cluster

cd ..