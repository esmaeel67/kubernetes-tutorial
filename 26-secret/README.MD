# Secret config

```bash

chmod +x 26-secret/command.sh


#copy this value to sert yaml and past as value for key
cat 26-secret/tls.key | base64 -w 0
cat 26-secret/tls.cert | base64 -w 0


# create cluster
kind create cluster --image kindest/node:v1.25.0  --config ./26-secret/kind-cluster.yml --name secret-cluster

# create namespace
kubectl create -f 26-secret/namespace.yml

# create secret config
kubectl create -f 26-secret/secret.yaml

# now we have secret with name: content-generator-nginx-secret
kubectl -n secret-ns get secrets 

# details of secret name
kubectl -n secret-ns get secrets content-generator-nginx-secret -o yaml

# we can decode value and we can see value of it
echo YmFy | base64 -d

# create pod
kubectl create -f 26-secret/pod.yml

# check container
kubectl -n secret-ns exec -it pods/content-generator -c nginx -- /bin/sh

# then cd /etc/nginx/certs we can see all entry in secret it exists now and then run curl command

curl -v -k https://test.local/ --resolve test.local:443:127.0.0.1


# imagePullSecrets
kubectl -n secret-ns create secret docker-registry my-private-reg --docker-server=reg.test.local --docker-username=user --docker-password=pass --docker-email=test@gmail.com

# created secret/my-private-reg created

# we can see details of it with this key .dockerconfigjson value eyJhdXRocyI6eyJyZWcudGVzdC5sb2NhbCI6eyJ1c2VybmFtZSI6InVzZXIiLCJwYXNzd29yZCI6InBhc3MiLCJlbWFpbCI6InRlc3RAZ21haWwuY29tIiwiYXV0aCI6ImRYTmxjanB3WVhOeiJ9fX0=
 kubectl -n secret-ns get secrets my-private-reg  -o yaml

 # now we can decode value and see details of it
 echo eyJhdXRocyI6eyJyZWcudGVzdC5sb2NhbCI6eyJ1c2VybmFtZSI6InVzZXIiLCJwYXNzd29yZCI6InBhc3MiLCJlbWFpbCI6InRlc3RAZ21haWwuY29tIiwiYXV0aCI6ImRYTmxjanB3WVhOeiJ9fX0= | base64 -d
 # result : {"auths":{"reg.test.local":{"username":"user","password":"pass","email":"test@gmail.com","auth":"dXNlcjpwYXNz"}}}

echo eyJhdXRocyI6eyJyZWcudGVzdC5sb2NhbCI6eyJ1c2VybmFtZSI6InVzZXIiLCJwYXNzd29yZCI6InBhc3MiLCJlbWFpbCI6InRlc3RAZ21haWwuY29tIiwiYXV0aCI6ImRYTmxjanB3WVhOeiJ9fX0= | base64 -d | jq .
# {
#   "auths": {
#     "reg.test.local": {
#       "username": "user",
#       "password": "pass",
#       "email": "test@gmail.com",
#       "auth": "dXNlcjpwYXNz"
#     }
#   }
# }
