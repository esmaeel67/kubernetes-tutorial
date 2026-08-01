# Kubernetes Service

## Overview

A **Service** is a Kubernetes resource that provides a stable network endpoint for a set of Pods. It enables reliable communication between applications by offering a fixed IP address and DNS name, even as Pods are dynamically created or destroyed.

### Why Use Services?

- **Stable IP**: Pods have ephemeral IPs that change on restart. Services provide a persistent endpoint.
- **Load Balancing**: Distributes traffic across multiple Pods automatically.
- **Service Discovery**: Enables applications to find each other via DNS or environment variables.

### Service Types

| Type | Scope | Use Case |
| ------ | ------- | ---------- |
| **ClusterIP** (Default) | Internal cluster only | Internal microservice communication |
| **NodePort** | External via node IPs | Development/testing, direct access |
| **LoadBalancer** | External via cloud LB | Production, public-facing apps |
| **ExternalName** | DNS alias | Access external services via Kubernetes DNS |

```kind create cluster --image kindest/node:v1.25.0  --config ./12-intro-service//kind-cluster.yml --name service-cluster```
```kubectl create -f ./12-intro-service/namespace.yml```
```kubectl create -f ./12-intro-service/replica-set.yml```
```kubectl -n service-intro exec -it ${service_name} -- /bin/sh```
```kubectl create -f ./12-intro-service/service.yml```
```kubectl -n service-intro  get services -o wide```

## sessionAffinity

`sessionAffinity` is a Service configuration that controls whether all traffic from a specific client is routed to the same Pod for the duration of a session. This ensures session persistence (also known as "sticky sessions").

### Syntax

```yaml
spec:
  sessionAffinity: ClientIP   # None | ClientIP
  sessionAffinityConfig:
    clientIP:
      timeoutSeconds: 10800   # 3 hours (default)
```
