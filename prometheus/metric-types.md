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

## Counters

Counter metrics are used for measurements that only increase. Therefore they are always cumulative—their value can only go up. The only exception is when the counter is restarted, in which case its value is reset to zero.

The actual value of a counter is not typically very useful on its own. A counter value is often used to compute the delta between two timestamps or the rate of change over time.

For example, a typical use case for counters is measuring API calls, which is a measurement that will always increase:

```exposition-format
# HELP http_requests_total Total number of http api requests
# TYPE http_requests_total counter
http_requests_total{api="add_product"} 4633433

```

The metric name is http_requests_total, it has one label named api with a value of add_product and the counter’s value is 4633433. This means that the add_product API has been called 4,633,433 times since the last service start or counter reset. By convention, counter metrics are usually suffixed with _total.

The absolute number does not give us much information, but when used with PromQL’s rate function (or a similar function in another monitoring backend), it helps us understand the requests per second that API is receiving. The PromQL query below calculates the average requests per second over the last five minutes:

```exposition-format
rate(http_requests_total{api="add_product"}[5m])
```

To calculate the absolute change over a time period, we would use a delta function which in PromQL is called increase():

increase(http_requests_total{api="add_product"}[5m])

This would return the total number of requests made in the last five minutes, and it would be the same as multiplying the per second rate by the number of seconds in the interval (five minutes in our case):

rate(http_requests_total{api="add_product"}[5m]) * 5 * 60

Other examples where you would want to use a counter metric would be to measure the number of orders in an e-commerce site, the number of bytes sent and received over a network interface or the number of errors in an application. If it is a metric that will always go up, use a counter.

Below is an example of how to create and increase a counter metric using the Prometheus client library for Python:

```python
from prometheus_client import Counter
api_requests_counter = Counter(
                        'http_requests_total',
                        'Total number of http api requests',
                        ['api']
                       )
api_requests_counter.labels(api='add_product').inc()
 
```

Note that since counters can be reset to zero, you want to make sure that the backend you use to store and query your metrics will support that scenario and still provide accurate results in case of a counter restart.

Gauges
Gauge metrics are used for measurements that can arbitrarily increase or decrease. This is the metric type you are likely more familiar with since the actual value with no additional processing is meaningful and they are often used. For example, metrics to measure temperature, CPU, and memory usage, or the size of a queue are gauges.

For example, to measure the memory usage in a host, we could use a gauge metric like:

```exposition-format
# HELP node_memory_used_bytes Total memory used in the node in bytes
# TYPE node_memory_used_bytes gauge
node_memory_used_bytes{hostname="host1.domain.com"} 943348382
```

The metric above indicates that the memory used in node host1.domain.com at the time of the measurement is around 900 megabytes. The value of the metric is meaningful without any additional calculation because it tells us how much memory is being consumed on that node.

Unlike when using counters, rate and delta functions don’t make sense with gauges. However, functions that compute the average, maximum, minimum, or percentiles for a specific series are often used with gauges. In Prometheus, the names of those functions are avg_over_time, max_over_time, min_over_time, and quantile_over_time. To compute the average of memory used on host1.domain.com in the last ten minutes, you could do this:

```exposition-format
avg_over_time(node_memory_used_bytes{hostname="host1.domain.com"}[10m])
```

In statistics, a k-th percentile, also known as percentile score or centile, is a score below which a given percentage k of scores in its frequency distribution falls or a score at or below which a given percentage falls.

To create a gauge metric using the Prometheus client library for Python you would do something like this:

```python
from prometheus_client import Gauge
memory_used = Gauge(
                'node_memory_used_bytes',
                'Total memory used in the node in bytes',
                ['hostname']
              )
memory_used.labels(hostname='host1.domain.com').set(943348382)
```


Histograms
Histogram metrics are useful to represent a distribution of measurements. They are often used to measure request duration or response size.

Histograms divide the entire range of measurements into a set of intervals—named buckets—and count how many measurements fall into each bucket.

A histogram metric includes a few items:

A counter with the total number of measurements. The metric name uses the _count suffix.
A counter with the sum of the values of all measurements. The metric name uses the _sum suffix.
The histogram buckets are exposed as counters using the metric name with a _bucket suffix and a le label indicating the bucket upper inclusive bound. Buckets in Prometheus are inclusive, that is a bucket with an upper bound of N (i.e., le label) includes all data points with a value less than or equal to N.

For example, the summary metric to measure the response time of the instance of the add_product API endpoint running on host1.domain.com could be represented as:

```exposition-format
# HELP http_request_duration_seconds Api requests response time in seconds
# TYPE http_request_duration_seconds histogram
http_request_duration_seconds_sum{api="add_product" instance="host1.domain.com"} 8953.332
http_request_duration_seconds_count{api="add_product" instance="host1.domain.com"} 27892
http_request_duration_seconds_bucket{api="add_product" instance="host1.domain.com" le="0"}
http_request_duration_seconds_bucket{api="add_product", instance="host1.domain.com", le="0.01"} 0
http_request_duration_seconds_bucket{api="add_product", instance="host1.domain.com", le="0.025"} 8
http_request_duration_seconds_bucket{api="add_product", instance="host1.domain.com", le="0.05"} 1672
http_request_duration_seconds_bucket{api="add_product", instance="host1.domain.com", le="0.1"} 8954
http_request_duration_seconds_bucket{api="add_product", instance="host1.domain.com", le="0.25"} 14251
http_request_duration_seconds_bucket{api="add_product", instance="host1.domain.com", le="0.5"} 24101
http_request_duration_seconds_bucket{api="add_product", instance="host1.domain.com", le="1"} 26351
http_request_duration_seconds_bucket{api="add_product", instance="host1.domain.com", le="2.5"} 27534
http_request_duration_seconds_bucket{api="add_product", instance="host1.domain.com", le="5"} 27814
http_request_duration_seconds_bucket{api="add_product", instance="host1.domain.com", le="10"} 27881
http_request_duration_seconds_bucket{api="add_product", instance="host1.domain.com", le="25"} 27890
http_request_duration_seconds_bucket{api="add_product", instance="host1.domain.com", le="+Inf"} 27892
  
```
    
The example above includes the sum, the count, and 12 buckets. The sum and count can be used to compute the average of a measurement over time. In PromQL, the average duration for the last five minutes will be computed as follows:

```PromQL
rate(http_request_duration_seconds_sum{api="add_product", instance="host1.domain.com"}[5m]) / rate(http_request_duration_seconds_count{api="add_product", instance="host1.domain.com"}[5m])
```
