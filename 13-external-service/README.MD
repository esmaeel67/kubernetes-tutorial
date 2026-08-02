# Kubernetes Service

## Overview

### How Services Connect to Endpoints

The Service and Endpoints share the same name. The Service defines which Pods (via selector), and Endpoints stores where they are (IPs), with kube-proxy handling the actual routing.

How Services Connect to Endpoints

1. Create a Service:
   $ kubectl get service my-service
   NAME         TYPE        CLUSTER-IP     PORT(S)
   my-service   ClusterIP   10.96.123.45   80/TCP

2. Check its Endpoints (same name):
   $ kubectl get endpoints my-service
   NAME         ENDPOINTS
   my-service   10.1.0.10:80,10.1.0.11:80,10.1.0.12:80

3. Traffic flow:

How Services Connect to Endpoints

Your Service (my-service)
    ↓ (same name)
Endpoints Object (my-service)
    ↓ (contains)
Pod IP: 10.1.0.10:80  ← If this Pod dies, it's automatically removed
Pod IP: 10.1.0.11:80  ← New Pods are automatically added
Pod IP: 10.1.0.12:80
    ↓ (kube-proxy uses)
Actual Traffic → One of these Pods

**Endpoints update automatically** when Pods are added/removed — no manual intervention needed!

## Endpoints

Endpoints are Kubernetes objects that store the actual IP addresses and ports of the Pods that match a Service's spec.selector. They're the "real" backend targets that the Service routes traffic to.

Example:
$ kubectl -n service-intro get endpoints
NAME                ENDPOINTS                         AGE
my-service          10.1.0.10:80,10.1.0.11:80,10.1.0.12:80    5m

If ENDPOINTS shows <none>, no Pods match the Service's selector.
