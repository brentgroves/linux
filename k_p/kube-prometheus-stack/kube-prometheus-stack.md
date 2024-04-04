# Kube-prometheus-stack

## References

https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack
<https://spacelift.io/blog/prometheus-kubernetes>
<https://github.com/digitalocean/Kubernetes-Starter-Kit-Developers/blob/main/04-setup-observability/prometheus-stack.md>
<https://medium.com/israeli-tech-radar/how-to-create-a-monitoring-stack-using-kube-prometheus-stack-part-1-eff8bf7ba9a9>
<https://gitlab.tikalk.dev/matan.amiel/kube-prometheus-stack/-/tree/main>

<https://grafana.com/docs/grafana/latest/setup-grafana/installation/kubernetes/>
<https://stackoverflow.com/questions/67373856/unable-to-access-prometheus-dashboard-port-forwarding-doesnt-work>
<https://grafana.com/docs/grafana/latest/setup-grafana/sign-in-to-grafana/#:~:text=To%20sign%20in%20to%20Grafana%20for%20the%20first%20time%2C%20follow,admin%20for%20username%20and%20password>.
<https://docs.syseleven.de/metakube-accelerator/building-blocks/observability-monitoring/kube-prometheus-stack>
https://code.syseleven.de/syseleven/building-blocks/helmfiles/kube-prometheus-stack


## Active Kube-prometheus-stack

Installs the **[kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack)**, a collection of Kubernetes manifests, Grafana dashboards, and **[Prometheus rules]** combined with documentation and scripts to provide easy to operate end-to-end Kubernetes cluster monitoring with **[Prometheus](https://prometheus.io/)** using the **[prometheus operator](https://github.com/prometheus-operator/kube-prometheus)**.

See the **[kube-prometheus](https://github.com/prometheus-operator/kube-prometheus)** README for details about components, dashboards, and alerts.

Note: This chart was formerly named prometheus-operator chart, now renamed to more clearly reflect that it installs the kube-prometheus project stack, within which Prometheus Operator is only one component.
