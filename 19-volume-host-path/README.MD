# Kubernetes Volumes

## What is hostPath?

A hostPath volume in Kubernetes lets you mount a specific file or directory from your worker node's filesystem directly into a Pod.

**Key Features:**

- ✅ Data persists beyond Pod lifecycle
- ✅ Direct access to host filesystem
- ✅ Simple configuration
- ❌ Pods must run on specific node
- ❌ Security risks if misconfigured

**Example:**

```yaml
volumes:
- name: host-data
  hostPath:
    path: /mnt/data
    type: DirectoryOrCreate
```

```kind create cluster --image kindest/node:v1.25.0  --config ./19-volume-host-path/kind-cluster.yml --name monitoring```
```kubectl create -f 19-volume-host-path/namespace.yml```
```kubectl -n monitoring exec -it pods/prometheus-node-exporter-njjqk  -- /bin/sh```
