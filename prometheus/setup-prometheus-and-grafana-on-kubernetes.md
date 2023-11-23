# setup-prometheus-and-grafana-on-kubernetes

## references

<https://getbetterdevops.io/setup-prometheus-and-grafana-on-kubernetes/>
<https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack?ref=getbetterdevops.io>

## **[Monitoring](https://getbetterdevops.io/setup-prometheus-and-grafana-on-kubernetes/)**

Monitoring is a key pillar of DevOps best practices to ensure performance and health. In a distributed environment such as Kubernetes and microservices, it is even more true. This tutorial shows you how to build effectively a modern monitoring stack with Prometheus & Grafana on Kubernetes.

Prometheus will collect, store and allow you to leverage your platform metrics. On the other hand, Grafana will plug into Prometheus and allow you to create beautiful dashboards and charts.

## **![Timeline](https://getbetterdevops.io/content/images/2022/09/image-71.png)**


## Architecture **![Architecture](https://getbetterdevops.io/content/images/2022/09/image-73.png)**

The architecture diagram shows Prometheus is a multi-component monitoring system. The following pieces are integrated into the Prometheus deployment:

- Prometheus server scraping and stores time-series data.
- It also provides a user interface to query the metrics.
- Client libraries for instrumenting application code.
- Pushgateway supports metrics collection from short-lived jobs
- Exporters for services that do not instrument Prometheus metrics directly.
- Alertmanager handles real-time alerts based on triggers

In classical Prometheus installation, adding new metric endpoints requires an update of the server configuration. This allows registering a new endpoint as a target to collect metrics. The Prometheus Operator uses Monitor objects  (PodMonitor, ServiceMonitor) to discover dynamically endpoints and scrape metrics.

Using the Prometheus Operator gains you time on the Prometheus installation and maintainability. It provides you Monitor objects to dynamically collect metrics without updating the Prometheus configuration

## Deploying Prometheus With The Operator

- The **[Prometheus Operator](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack?ref=getbetterdevops.io)**, kube-prometheus-stack is a collection of Kubernetes manifests, Grafana dashboards, and Prometheus rules. It provides easy-to-operate end-to-end Kubernetes cluster monitoring with Prometheus using the Operator.