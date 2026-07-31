# Replication controller

A Replication Controller is a Kubernetes controller that ensures a specified number of pod replicas
are running at all times. It continuously monitors the cluster and maintains the desired state by
creating or deleting pods as needed.

**Key Responsibilities:**

- **Guarantees Availability**: Ensures the specified number of pod replicas are always running
- **Self-Healing**: Automatically replaces pods that fail, crash, or are deleted
- **Scaling**: Supports manual scaling by adjusting the replica count
- **Load Distribution**: Distributes traffic across multiple pod replicas

**How it Works:**

1. You define a Replication Controller with a pod template and a desired replica count
2. The controller continuously monitors the running pods
3. If a pod crashes, the controller creates a replacement pod
4. If there are too many pods, it terminates the extras
5. If there are too few, it starts new ones

**Common Use Cases:**

- Ensuring high availability for stateless applications
- Load balancing across multiple pod instances
- Handling pod failures automatically
- Manual or automatic scaling of applications

**Note:** Replication Controllers have been largely superseded by ReplicaSets and Deployments,
which offer additional features like rolling updates and rollback capabilities. However,
Replication Controllers are still supported in Kubernetes for backward compatibility.

> ```
> kind create cluster --image kindest/node:v1.25.0  --config ./replication-controller/kind-cluster.yml --name replica-cluster
> kubectl create -f ./replication-controller/namespace.yaml
> kubectl create -f ./replication-controller/replication-controller.yml
> kubectl -n replica-ns get pods
> kubectl delete -f ./replication-controller/replication-controller.yml 
> ```

## Editing a ReplicationController

This command allows you to edit the configuration of the ReplicationController named app running in the replica-ns namespace.
rc: The resource type - ReplicationController (abbreviated as rc)

### Command

```bash
kubectl -n replica-ns edit rc app


## Inspecting a ReplicationController
This command provides detailed information about the ReplicationController named app in the replica-ns namespac
### Command
```bash
kubectl -n replica-ns describe rc app

## Delete rc(ReplicationController)
### Command

kubectl -n replica-ns delete rc app

delete replication controller without delete pod --cascade=orphan
kubectl -n replica-ns delete rc app --cascade=orphan

## Monitoring Pods in Real-Time

### Command
```bash
kubectl -n replica-ns get pods -o wide -w

