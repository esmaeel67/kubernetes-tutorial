# 🚀 Kubernetes Learning Journey

> A hands-on guide to mastering Kubernetes from basics to production-ready deployments

## Monitoring Pods in Real-Time

### Command

```bash
# Create cluster
kind create cluster --image kindest/node:v1.25.0  --config ./replication-controller/kind-cluster.yml --name replica-cluster

# Watch pods
kubectl -n replica-ns get pods -o wide -w

# Watch nodes
kubectl get nodes -w

# Get node details 
kubectl get nodes replica-cluster-worker -o yaml

# Taint: This node has a special condition, don't schedule pods here unless they can handle it
# Toleration: I can handle this special condition, schedule me here
kubectl get nodes replica-cluster-control-plane -o yaml

# Example delete pod or daemon set command
kubectl delete -f ./09-daemon-set/daemon-set.yml

