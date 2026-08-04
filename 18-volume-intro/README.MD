# File System Isolated

## Volume Types

### 1. Network Storage

#### 1-1 Cloud

- 1-1-1: Azure
- 1-1-2: GCP
- 1-1-3: AWS

#### 1-2 On-Premise

- 1-2-1: NFS
- 1-2-2: Ceph
- 1-2-3: Cluster
- 1-2-4: OpenStack

### 2. Local Storage

- 2-1: EmptyDir
- 2-2: HostPath
- 2-3: Local

### 3. Special Storage

- 3-1: Secret
- 3-2: ConfigMap
- 3-3: Downward API

---

## Two Processes

- Video Encoding
- Directory

---

## EmptyDir Volume

`emptyDir` is a temporary storage volume that:

- ✅ Lives as long as the Pod exists
- ✅ Survives container restarts
- ❌ Is deleted when Pod is removed
- ✅ Can be shared between containers in the same Pod
- ✅ Can use RAM instead of disk with `medium: "Memory"`

**Use for**: Caching, temporary files, inter-container communication  
**Don't use for**: Persistent data, databases, or anything that must survive Pod deletion

**Example:**

```yaml
volumes:
- name: cache
  emptyDir:
    medium: "Memory"  # Optional: use RAM
    sizeLimit: 500Mi  # Optional: limit size

# esmaeil157-demo-app

A simple Docker application that continuously updates an index.html file with timestamps, designed for Kubernetes deployment with shared volumes.

## Prerequisites

- Docker installed
- Kind (Kubernetes in Docker) installed
- kubectl installed
- Kubernetes cluster access

## Build Instructions

### 1. Make scripts executable
```bash
chmod +x entrypoint.sh
chmod +x commands.sh
## then run this file
./commands.sh

## Create the Kind cluster
kind create cluster --image kindest/node:v1.25.0 --config ./18-volume-intro/kind-cluster.yml --name volume-cluster

## Deploy to Kubernetes
# Create namespace
kubectl create -f ./18-volume-intro/namespace.yml

# Deploy ReplicaSet
kubectl create -f ./18-volume-intro/replica-set.yml

# Create Service
kubectl create -f ./18-volume-intro/service.yml

# Verify deployment
# Check pods in the namespace
kubectl -n volume-ns get pods

# Check services
kubectl -n volume-ns get services

# Check ReplicaSet
kubectl -n volume-ns get replicasets

# Get pod name first
kubectl -n volume-ns get pods

# View logs from the app container
kubectl -n volume-ns logs <pod-name> -c app-demo-ca

# Stream logs in real-time
kubectl -n volume-ns logs -f <pod-name> -c app-demo-ca


# In another terminal, access the application 
# service port replace with 8080
curl http://localhost:8080/