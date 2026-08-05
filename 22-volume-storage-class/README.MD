
# Volume Storage class

```bash

# create cluster and namespace first then run them
kubectl create -f 22-volume-storage-class/namespace.yml 

# check how storage class exists
kubectl get storageclasses.storage.k8s.io 

# Create storage class
kubectl create -f 22-volume-storage-class/storage-class.yml

# check storage class list
kubectl get storageclasses.storage.k8s.io 

# create pvc 
kubectl create -f 22-volume-storage-class/pvc.yml

# check list of pv
kubectl get pv

# 
kubectl -n psc-ns describe pvc postgres-pvc
# create pod and check events
kubectl create -f 22-volume-storage-class/pod.yml

# check events of pvc
kubectl -n psc-ns describe pvc postgres-pvc

# check pvc status it has been bound now
kubectl -n psc-ns get pvc

# And check PV it has been created automatically
kubectl get pv

# check output of pv
kubectl get pv pvc-6796292a-2c89-4022-a233-206d5c765893 -o yaml

```
