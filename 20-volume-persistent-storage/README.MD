# File System Isolated

## Volume Types

### 1. Network Storage

Network storage volumes are accessible from any node in the cluster, making them ideal for data that needs to be shared across multiple Pods or persisted beyond Pod lifecycle.

#### Cloud-Based Storage

Cloud storage solutions are fully managed by cloud providers, offering high durability, automatic scaling, and integrated security.

#### Cloud

- **GCE** - Google Cloud persistent disks
- **AWS** - Amazon EBS volumes
- **Azure** - Azure managed disks

#### On-Premise

- **Ceph** - Distributed storage system
- **FC** - Fibre Channel (high-speed block storage)
- **GlusterFS** - Scalable distributed file system
- **NFS** - Network File System

### 💾 Local Storage (Node-Specific)

- **EmptyDir** - Temporary, Pod-scoped storage
- **HostPath** - Mount host node filesystem
- **Local** - Persistent local volumes

### 🔒 Special Storage (Kubernetes-Native)

- **Secret** - Store sensitive data (encoded)
- **ConfigMap** - Store non-sensitive configuration
- **Downward API** - Expose Pod metadata
