# Kubernetes CronJob

## Overview

A **CronJob** is a Kubernetes controller that runs Jobs on a scheduled basis, similar to a cron system in Linux/Unix. It creates Job objects that execute according to a specified schedule, making it perfect for recurring tasks.

### Key Characteristics

| Feature | Description |
| --------- | ------------- |
| **Scheduled Execution** | Runs Jobs at specific times/dates |
| **Job Management** | Automatically creates and manages Job objects |
| **Concurrency Control** | Prevents overlapping executions |
| **History Retention** | Keeps record of successful and failed Jobs |
| **Automatic Cleanup** | Removes old Jobs after specified retention period |

### When to Use CronJobs

| Use Case | Example |
| ---------- | --------- |
| **Database Backups** | Daily backup at 2 AM |
| **Report Generation** | Weekly sales reports |
| **Data Cleanup** | Delete old logs every hour |
| **Email Notifications** | Send daily digest emails |
| **System Maintenance** | Reindex search indexes nightly |
| **Batch Processing** | Process pending orders every 30 minutes |

### Quick Reference

| Command | Purpose |
| --------- | --------- |
| `kubectl get cronjob my-job -o yaml` | View full CronJob configuration |
| `kubectl get jobs -l cronjob=my-job` | List Jobs created by a specific CronJob |
| `kubectl get jobs --sort-by=.status.startTime` | View Jobs sorted by execution time |
| `kubectl describe cronjob my-job` | Get detailed CronJob information and events |
| `kubectl logs -n kube-system deployment/cronjob-controller` | View CronJob controller logs |

`kubectl get cronjobs.batch  -n cronjob-ns`
