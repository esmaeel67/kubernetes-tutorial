# Persistent Storage (PV & PVC)

Persistent Storage decouples storage from Pod lifecycle, allowing data to survive even if the Pod is deleted or rescheduled. It consists of two key resources:

| Resource | Description |
|----------|-------------|
| **PersistentVolume (PV)** | A cluster-wide storage resource provisioned by an administrator. It represents the actual physical storage (e.g., GCE Persistent Disk, NFS, AWS EBS). |
| **PersistentVolumeClaim (PVC)** | A request for storage by a user or Pod. It defines storage size, access modes, and storage class requirements.

> Cluster admin
> Cluster user
>
## Hands-On: PV & PVC

> Create namespace and PV

```bash
kubectl create -f 21-persistent-volume-claim/namespace.yml
kubectl create -f 21-persistent-volume-claim/pv.yml

# Create name space
kubectl create -f 21-persistent-volume-claim/namespace.yml
# Create PV
kubectl create -f 21-persistent-volume-claim/pv.yml

# how we can see result of the  persist volume
kubectl get pv

# Create pvc(PersistentVolumeClaim)
kubectl create -f 21-persistent-volume-claim/pvc.yml
# now we can see pvc on namespace pvc-ns

kubectl -n pvc-ns get pvc

# now check status and it moved from Available to Bound
kubectl  get pv
