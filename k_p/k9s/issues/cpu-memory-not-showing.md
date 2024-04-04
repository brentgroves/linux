# Could not see CPU/MEM columns for pods

Make sure the metrics server is enabled.

## Enable Metrics Server

```bash
kubectl top nodes
error: Metrics API not available
microk8s enable metrics-server
NAME        CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%   
reports11   223m         2%     2077Mi          26%       
reports12   396m         4%     2351Mi          30%       
reports13   265m         3%     4793Mi          49%  
```

<https://github.com/derailed/k9s/issues/867>

Could be a perm issue, If so check the k9s logs. Also check the metrics-server is running on that cluster with no issues. Also try kubectl top nodes on that cluster for that user.

```bash
kubectl top nodes
error: Metrics API not available
```

metrics-server needs two scripe cycles to provide metrics.
If kubectl top node has no metrics after two scripe cycles, please contine to provide the logs of metrics-srever
