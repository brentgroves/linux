# Monitoring Kubernetes Layers

## References

<https://grafana.com/blog/2023/01/25/monitoring-kubernetes-layers-key-metrics-to-know/>

<https://stackoverflow.com/questions/65621273/how-to-scrape-metrics-server-to-prometheus-outside-kubernetes-cluster>

<https://github.com/kubernetes/kube-state-metrics>

## kube-state-metrics vs. metrics-server

The metrics-server is a project that has been inspired by Heapster and is implemented to serve the goals of core metrics pipelines in Kubernetes monitoring architecture. It is a cluster level component which periodically scrapes metrics from all Kubernetes nodes served by Kubelet through Metrics API. The metrics are aggregated, stored in memory and served in Metrics API format. The metrics-server stores the latest values only and is not responsible for forwarding metrics to third-party destinations.

kube-state-metrics is focused on generating completely new metrics from Kubernetes' object state (e.g. metrics based on deployments, replica sets, etc.). It holds an entire snapshot of Kubernetes state in memory and continuously generates new metrics based off of it. And just like the metrics-server it too is not responsible for exporting its metrics anywhere.

Having kube-state-metrics as a separate project also enables access to these metrics from monitoring systems such as Prometheus.
