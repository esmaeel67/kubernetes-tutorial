# Job Configuration Keys

## Overview

A Kubernetes Job is a controller that creates one or more pods and ensures that they successfully complete their execution. Unlike Deployments or ReplicationControllers that run continuously, Jobs are designed for batch processing and one-time tasks that should terminate after completion.

### Configuration Reference

| Key | Description | Default | Example |
| ----- | ------------- | --------- | --------- |
| **`completions`** | Number of successfully completed pods required for the Job to be considered finished | `1` | `completions: 5` |
| **`parallelism`** | Maximum number of pods running simultaneously (in parallel) | `1` | `parallelism: 2` |
| **`activeDeadlineSeconds`** | Maximum time (in seconds) the Job can run before being terminated | Unlimited | `activeDeadlineSeconds: 100` |
| **`backoffLimit`** | Number of retries for failed pods before marking the Job as failed | `6` | `backoffLimit: 4` |

### Command

```bash
# Create a job from file
kubectl apply -f job.yaml

# Create a job directly with kubectl
kubectl create job my-job --image=busybox -- echo "Hello World"

# List all jobs
kubectl get jobs

# List jobs in a namespace
kubectl get jobs -n production

# List jobs with details
kubectl get jobs -o wide

# Describe a job
kubectl describe job pi-calculator

# Get job YAML
kubectl get job pi-calculator -o yaml

# Delete a job
kubectl delete job pi-calculator

# Delete all jobs
kubectl delete jobs --all
```

> Step one create cluster : kind create cluster --image kindest/node:v1.25.0  --config ./10-job/kind-cluster.yml --name job-cluster
> Step Two create namespace : kubectl create -f ./10-job/namespace.yml
> Step three create job: kubectl create -f ./10-job/job.yml
> After 30 second we can check pod status and it changed from Running to Completed
