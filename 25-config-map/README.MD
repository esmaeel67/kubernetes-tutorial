# Config map

```bash

kubectl create -f 25-config-map/config-map.yml

kubectl -n config-map-ns get cm

kubectl -n config-map-ns get cm content-generator-config -o yaml

kubectl create -f ./25-config-map/pod.yml

kubectl -n config-map-ns logs pods/content-generator

# updated and apply
kubectl apply -f 25-config-map/config-map.yml


# create service
kubectl create -f 25-config-map/service.yaml
