# Liveness probes

> **determine when to restart a container**

> **periodSeconds**: how many seconds between each request sent to check the endpoint

> **successThreshold**: how many consecutive successful requests are required to consider the endpoint healthy

> **failureThreshold**: default is 3; this defines how many consecutive failures are allowed before the service is considered down

> **terminationGracePeriodSeconds**: the amount of time (in seconds) given to the container to shut down gracefully after a restart is triggered, before it is forcefully killed

> **initialDelaySeconds**: the number of seconds to wait after the container starts before performing the first probe check, giving the application time to initialize

> **CrashLoopBackOff**: a status indicating that a container is repeatedly crashing and restarting; Kubernetes applies an exponential backoff delay between restart attempts to prevent system overload

> **Watch command**:
> ```
> kubectl -n test get pods -w
> ```
> The `-w` flag (or `--watch`) continuously monitors and streams real-time updates of pod statuses in the specified namespace (`test`). It automatically refreshes the output whenever there is a change (e.g., pod restarts, status changes to CrashLoopBackOff, or becomes Running). Press `Ctrl+C` to exit the watch mode.