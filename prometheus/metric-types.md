# A Deep Dive Into the Four Types of Prometheus Metrics

## References

<https://www.timescale.com/blog/four-types-prometheus-metrics-to-collect/>
<https://prometheus.io/docs/instrumenting/clientlibs/>

## Article

Metrics measure performance, consumption, productivity, and many other software properties over time. They allow engineers to monitor the evolution of a series of measurements (like CPU or memory usage, requests duration, latencies, and so on) via alerts and dashboards. Metrics have a long history in the world of IT monitoring and are widely used by engineers together with logs and traces to detect when systems don’t perform as expected.

In its most basic form, a metric data point is made of:

- A metric name
- The timestamp when the data point was collected
- A measurement represented by a numeric value

In the last ten years, as systems have become increasingly complex, the concept of dimensional metrics, that is, metrics that also include a set of tags or labels (i.e., the dimensions) to provide additional context, emerged. Monitoring systems that support dimensional metrics allow engineers to easily aggregate and analyze a metric across multiple components and dimensions by querying for a specific metric name and filtering and grouping by label.

For modern dynamic systems comprising many components, Prometheus, a Cloud Native Computing Foundation (CNCF) project, has become the most popular open-source monitoring software and is effectively the industry standard for metrics monitoring.

Prometheus defines a metric exposition format and a remote write protocol that the community and many vendors have adopted to expose and collect metrics, becoming a de facto standard. OpenMetrics is another CNCF project that builds upon the Prometheus exposition format to offer a vendor-agnostic, standardized model for the collection of metrics that aims to be part of the Internet Engineering Task Force (IEFT).

Exposition formats
Prometheus implements two different wire formats which clients may use to expose metrics to a Prometheus server: a simple text-based format and a more efficient and robust protocol-buffer format. Prometheus servers and clients use content negotation to establish the actual format to use. A server will prefer receiving the protocol-buffer format, and will fall back to the text-based format if the client does not support the former.

<https://prometheus.io/docs/instrumenting/clientlibs/>

The majority of users should use the existing **[client libraries](https://github.com/Showmax/prometheus-docs/blob/master/docs/instrumenting/clientlibs)** that already implement the exposition formats.

More recently, another CNCF project, OpenTelemetry, has emerged with the goal of providing a new standard that unifies the collection of metrics, traces, and logs, enabling easier instrumentation and correlation across telemetry signals.

With a few different options to pick from, you may be wondering which standard is best for you. To help you answer this question, we have prepared a three-part blog post series in which we will be diving deep into the metric standards hosted by the CNCF.

In this first post, we will cover Prometheus metrics; in the next one, we will review OpenTelemetry metrics; and in the final blog post, we will directly compare both formats—providing some recommendations for better interoperability.

Our hope is that after reading these blog posts, you will understand the differences between each standard, so you can decide which one would best address your current (and future) needs.

Prometheus Metrics
First things first. There are four types of metrics collected by Prometheus as part of its exposition format:

- Counters
- Gauges
- Histograms
- Summaries

Prometheus uses a pull model to collect these metrics; that is, Prometheus scrapes HTTP endpoints that expose metrics. Those endpoints can be natively exposed by the component being monitored or exposed via one of the hundreds of Prometheus exporters built by the community. Prometheus provides client libraries in different programming languages that you can use to instrument your code.

The pull model works great when monitoring a Kubernetes cluster, thanks to service discovery and shared network access within the cluster, but it’s harder to use to monitor a dynamic fleet of virtual machines, AWS Fargate containers or Lambda functions with Prometheus. Why?

It’s difficult to identify the metrics endpoints to be scraped, and access to those endpoints may be limited by network security policies. To solve some of those problems, the community released the Prometheus Agent Mode at the end of 2021, which only collects metrics and sends them to a monitoring backend using the remote write protocol.

Prometheus can scrape metrics in both the Prometheus exposition and the OpenMetrics formats. In both cases, metrics are exposed via HTTP using a simple text-based format (more commonly used and widely supported) or a more efficient and robust protocol buffer format. One big advantage of the text format is that it is human-readable, which means you can open it in your browser or use a tool like curl to retrieve the current set of exposed metrics.

Prometheus uses a very simple metric model with four metric types that are only supported in the client libraries. All the metric types are represented in the exposition format using one or a combination of a single underlying data type. This data type includes a metric name, a set of labels, and a float value. The timestamp is added by the monitoring backend (Prometheus, for example) or an agent when they scrape the metrics.

Each unique combination of a metric name and set of labels defines a series while each timestamp and float value defines a sample (i.e., a data point) within a series.

Some conventions are used to represent the different metric types.

A very useful feature of the Prometheus exposition format is the ability to associate metadata to metrics to define their type and provide a description. For example, Prometheus makes that information available, and Grafana uses it to display additional context to the user that helps them select the right metric and apply the right PromQL functions:

**![metrics-labels](https://www.timescale.com/blog/content/images/2022/04/prometheus-metrics-labels-grafana.png)**

Example of a metric exposed using the Prometheus exposition format:

```exposition-format
# HELP http_requests_total Total number of http api requests
# TYPE http_requests_total counter
http_requests_total{api="add_product"} 4633433
```

## HELP is used to provide a description for the metric and # TYPE a type for the metric

Now, let's get into more detail about each of the Prometheus metrics in the exposition format.
