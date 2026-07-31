# Replica set

replicaSet = replicationController + better selection

## replication controller is deprecated and now using Replica set

### Command

```bash
kubectl get rc -n replica-set



# Selector using matchExpressions
selector:
matchLabels:
    name: app
matchExpressions:
# Example 1: Pod must have label "name" with value "app"
- key: name
    operator: In
    values:
    - app

# Example 2: Pod must have label "project" with value "A" OR "B"
- key: project
    operator: In
    values:
    - A
    - B

# Example 3: Pod must have label "environment" (any value)
# - key: environment
#   operator: Exists

# Example 4: Pod must NOT have label "deprecated"
# - key: deprecated
#   operator: DoesNotExist

# Example 5: Pod must NOT have label "tier" with value "test"
# - key: tier
#   operator: NotIn
#   values:
#   - test
