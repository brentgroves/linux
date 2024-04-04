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

This collection is available and deployable through a Helm chart. You can deploy in a single command line the monitoring stack – New to Helm? Have a look at this tutorial to get started!

Creating the dedicated monitoring namespace
In Kubernetes, namespaces provide a mechanism for isolating groups of resources within a single cluster. We create a namespace named monitoring to prepare the new deployment:

```bash
kubectl create namespace monitoring
```

## Installing kube-prometheus-stack with Helm

Add the Prometheus chart repository and update the local cache:

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update 
```

## Deploy the kube-stack-prometheus chart in the namespace monitoring with Helm

```bash
helm upgrade --namespace monitoring --install kube-stack-prometheus prometheus-community/kube-prometheus-stack 

NAME: kube-stack-prometheus
LAST DEPLOYED: Mon Nov 27 13:23:32 2023
NAMESPACE: monitoring
STATUS: deployed
REVISION: 1
NOTES:
kube-prometheus-stack has been installed. Check its status by running:
  kubectl --namespace monitoring get pods -l "release=kube-stack-prometheus"

Visit https://github.com/prometheus-operator/kube-prometheus for instructions on how to create & configure Alertmanager and Prometheus instances using the Operator.
```

hostRootFsMount.enabled is set to false to work on Docker Desktop on Mac

CRDs are now installed in the namespace. You can verify with the following kubectl command:

```bash
kubectl get -n monitoring crds 
NAME                                                  CREATED AT
bgpconfigurations.crd.projectcalico.org               2023-11-10T23:53:49Z
bgppeers.crd.projectcalico.org                        2023-11-10T23:53:49Z
blockaffinities.crd.projectcalico.org                 2023-11-10T23:53:49Z
caliconodestatuses.crd.projectcalico.org              2023-11-10T23:53:49Z
clusterinformations.crd.projectcalico.org             2023-11-10T23:53:49Z
felixconfigurations.crd.projectcalico.org             2023-11-10T23:53:49Z
globalnetworkpolicies.crd.projectcalico.org           2023-11-10T23:53:49Z
globalnetworksets.crd.projectcalico.org               2023-11-10T23:53:49Z
hostendpoints.crd.projectcalico.org                   2023-11-10T23:53:49Z
ipamblocks.crd.projectcalico.org                      2023-11-10T23:53:49Z
ipamconfigs.crd.projectcalico.org                     2023-11-10T23:53:49Z
ipamhandles.crd.projectcalico.org                     2023-11-10T23:53:49Z
ippools.crd.projectcalico.org                         2023-11-10T23:53:49Z
ipreservations.crd.projectcalico.org                  2023-11-10T23:53:49Z
kubecontrollersconfigurations.crd.projectcalico.org   2023-11-10T23:53:49Z
networkpolicies.crd.projectcalico.org                 2023-11-10T23:53:49Z
networksets.crd.projectcalico.org                     2023-11-10T23:53:49Z
bfdprofiles.metallb.io                                2023-11-11T00:06:37Z
bgpadvertisements.metallb.io                          2023-11-11T00:06:37Z
communities.metallb.io                                2023-11-11T00:06:37Z
ipaddresspools.metallb.io                             2023-11-11T00:06:37Z
l2advertisements.metallb.io                           2023-11-11T00:06:37Z
addresspools.metallb.io                               2023-11-11T00:06:36Z
bgppeers.metallb.io                                   2023-11-11T00:06:37Z
innodbclusters.mysql.oracle.com                       2023-11-11T00:27:35Z
mysqlbackups.mysql.oracle.com                         2023-11-11T00:27:35Z
clusterkopfpeerings.zalando.org                       2023-11-11T00:27:35Z
kopfpeerings.zalando.org                              2023-11-11T00:27:35Z
alertmanagerconfigs.monitoring.coreos.com             2023-11-17T22:09:16Z
alertmanagers.monitoring.coreos.com                   2023-11-17T22:09:16Z
podmonitors.monitoring.coreos.com                     2023-11-17T22:09:16Z
probes.monitoring.coreos.com                          2023-11-17T22:09:16Z
prometheusagents.monitoring.coreos.com                2023-11-17T22:09:16Z
prometheuses.monitoring.coreos.com                    2023-11-17T22:09:16Z
prometheusrules.monitoring.coreos.com                 2023-11-17T22:09:16Z
scrapeconfigs.monitoring.coreos.com                   2023-11-17T22:09:16Z
servicemonitors.monitoring.coreos.com                 2023-11-17T22:09:16Z
thanosrulers.monitoring.coreos.com                    2023-11-17T22:09:17Z
```

Here is what we have running now in the namespace:

```bash
kubectl get pods -n monitoring

NAME                                                        READY   STATUS    RESTARTS   AGE
kube-stack-prometheus-kube-operator-75896d9cf4-pvxsl        1/1     Running   0          3m16s
kube-stack-prometheus-prometheus-node-exporter-2x4wx        1/1     Running   0          3m16s
kube-stack-prometheus-prometheus-node-exporter-9pklb        1/1     Running   0          3m16s
kube-stack-prometheus-prometheus-node-exporter-sb9wh        1/1     Running   0          3m16s
alertmanager-kube-stack-prometheus-kube-alertmanager-0      2/2     Running   0          3m15s
kube-stack-prometheus-kube-state-metrics-785c596fd7-4rnlj   1/1     Running   0          3m16s
kube-stack-prometheus-grafana-868dd5c8fb-bdnks              3/3     Running   0          3m16s
prometheus-kube-stack-prometheus-kube-prometheus-0          2/2     Running   0          3m14s
```

The chart has installed Prometheus components and Operator, Grafana – and the following exporters:

prometheus-node-exporter exposes hardware and OS metrics
kube-state-metrics listens to the Kubernetes API server and generates metrics about the state of the objects

Our monitoring stack with Prometheus and Grafana is up and ready!

## Connecting To Prometheus Web Interface

The Prometheus web UI is accessible through port-forward with this command:

```bash
kubectl port-forward --namespace monitoring svc/kube-stack-prometheus-kube-prometheus 9090:9090
```

Opening a browser tab on <http://localhost:9090> shows the Prometheus web UI. We can retrieve the metrics collected from exporters:

**![Prometheus web UI](https://getbetterdevops.io/content/images/2022/09/image-74.png)**

Going to the "Status>Targets" and you can see all the metric endpoints discovered by the Prometheus server:

**![Targets](https://getbetterdevops.io/content/images/2022/09/image-75.png)**

The metric endpoints discovered by Prometheus are visible in Status>Targets menu

**![All Targets](https://getbetterdevops.io/content/images/2022/09/image-76.png)**

## Connecting To Grafana

The credentials to connect to the Grafana web interface are stored in a Kubernetes Secret and encoded in base64. We retrieve the username/password couple with these two commands:

```bash
kubectl get secret --namespace monitoring kube-stack-prometheus-grafana -o jsonpath='{.data.admin-user}' | base64 -d
# admin

kubectl get secret --namespace monitoring kube-stack-prometheus-grafana -o jsonpath='{.data.admin-password}' | base64 -d 
# prom-operator
```

## We create the port-forward to Grafana with the following command

```bash
kubectl port-forward --namespace monitoring svc/kube-stack-prometheus-grafana 8080:80
```

Open your browser and go to <http://localhost:8080> and fill in previous credentials:

The kube-stack-prometheus deployment has  provisioned Grafana dashboards:

**![dashboards](https://getbetterdevops.io/content/images/2022/09/image-78.png)##

Here we can see one of them showing compute resources of Kubernetes pods:

**![compute resources](https://getbetterdevops.io/content/images/2022/09/image-79.png)**
