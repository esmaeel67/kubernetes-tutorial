# Daemon set

A DaemonSet is a Kubernetes controller that ensures a copy of a pod runs on every node (or a subset of nodes) in your cluster. As nodes are added or removed, the DaemonSet automatically adds or removes pods accordingly.

## DaemonSet Commands Cheat Sheet

### Overview

DaemonSets ensure that a pod runs on every node in your cluster. Here are the essential commands for managing DaemonSets.

### Listing DaemonSets

```bash
# Step 1: Create cluster
kind create  cluster --image kindest/node:v1.25.0 --config ./09-daemon-set/kind-cluster.yml  --name daemon-cluster

# Step 2:  Create namespace
kubectl create -f ./09-daemon-set/namespace.yml

# Step 3: check nodes
kubectl get nodes

# Step 4: create daemon-set
kubectl create -f ./09-daemon-set/daemon-set.yml

# Step 5: check ds(daemonsets.apps)
kubectl -n monitoring get ds
# same ds = daemonsets.apps
kubectl -n monitoring get daemonsets.apps


# List all DaemonSets in a namespace
kubectl get daemonsets -n logging

# List all DaemonSets in all namespaces
kubectl get daemonsets --all-namespaces

# List with additional details
kubectl get daemonsets -n logging -o wide

# Watch DaemonSets in real-time
kubectl get daemonsets -n logging -w

# delete daemon set
kubectl delete -f ./09-daemon-set/daemon-set.yml
