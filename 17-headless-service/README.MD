# Headless Services


A Headless Service is a Kubernetes Service that has clusterIP: None set in its spec. Instead of providing a single virtual IP for load balancing, it returns the actual IP addresses of the Pods directly to the client via DNS.

DNS Difference:

- Normal Service: returns a single VIP (10.96.123.45)
- Headless Service: returns all Pod IPs (10.1.0.10, 10.1.0.11, 10.1.0.12)