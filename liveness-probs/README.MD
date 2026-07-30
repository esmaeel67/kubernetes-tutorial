# Liveness probes

> **determine when to restart a container**

> **periodSeconds**: how many seconds between each request sent to check the endpoint

> **successThreshold**: how many consecutive successful requests are required to consider the endpoint healthy

> **failureThreshold**: default is 3; this defines how many consecutive failures are allowed before the service is considered down

> **terminationGracePeriodSeconds**: the amount of time (in seconds) given to the container to shut down gracefully after a restart is triggered, before it is forcefully killed
