# Kubernetes Annotations

Annotations are key-value pairs in Kubernetes that attach arbitrary metadata to objects
(such as pods, services, deployments, or ingresses). Unlike labels, annotations are not
used for selection or querying but are meant for non-identifying information that tools,
libraries, or users can retrieve.

**Key Characteristics:**

- **Non-identifying**: Not used for selecting or grouping objects (unlike labels)
- **Flexible**: Can store any type of metadata (structured or unstructured)
- **Optional**: Not required for object identification
- **User-defined**: Can be added manually or automatically by tools
- **Size limit**: Maximum total size of annotations per object is 256KB

**Common Use Cases:**

- **Build/Release Information**: Git commit hash, build timestamp, version numbers
- **Monitoring/Logging**: Prometheus scrape configuration, log settings
- **Deployment Tools**: Deployment tool names, configuration management references
- **Contact Information**: Team owner, email, on-call details
- **Rollout Information**: Rollback status, deployment strategy
- **Third-party Tooling**: Ingress controller configurations, service mesh settings

**Key Differences from Labels:**

| Aspect | Labels | Annotations |
| -------- | -------- | ------------- |
| **Purpose** | Identification and grouping | Metadata and documentation |
| **Queryable** | Yes (using selectors) | No |
| **Filtering** | Used for filtering workloads | Cannot be used for filtering |
| **Size** | Smaller, restricted | Larger, up to 256KB |
| **Examples** | environment=production, app=api | build-id=12345, deploy-timestamp=2026-01-15 |
