
# Command

```bash
# create readiness cluster
kind create cluster --image kindest/node:v1.25.0  --config ./16-readiness-probe/kind-cluster.yml --name readiness-cluster

# create namespace
kubectl create -f 16-readiness-probe/namespace.yml 

# create replica set
kubectl create -f 16-readiness-probe/replica-set.yml

# check is ready pods
kubectl -n readiness-ns get pods -o wide

# check tmp/ready folder is exists
kubectl -n readiness-ns exec -it pods/app-demo-2gw82 -- ls /tmp/ready
# out is error is not exists so that app is not ready
# ls: /tmp/ready: No such file or directory
# command terminated with exit code 1

# create service
kubectl create -f 16-readiness-probe/service.yml

## check service is exists and 
kubectl -n readiness-ns get services

# after that we send request with curl to one of the apps and response is connection refused
#now we check endpoints
kubectl -n readiness-ns get endpoints
## result of this is empty because all of the pods is not ready

# now make file with this for pod name(pods/app-demo-{dynamic} ) and update all of them then we can see pods all ready and then added ip to endpoints
kubectl -n readiness-ns exec -it pods/app-demo-2gw82 -- touch /tmp/ready

# check endpoints ips

#### check all dependency external and we have timeout for them ***
#### check external service connection, Storage, performance and timeout ###
#### add good probes of Readiness probes ###
### implement application endpoint: get /ready can be good name for it
