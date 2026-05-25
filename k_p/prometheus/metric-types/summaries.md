# Summaries

## references

https://www.timescale.com/blog/four-types-prometheus-metrics-to-collect/
https://prometheus.io/docs/practices/histograms/

## Prometheus Summaries

Like histograms, summary metrics are useful to measure request duration and response sizes.

A summary metric includes these items:

- A counter with the total number of measurements. The metric name uses the _count suffix.

- A counter with the sum of the values of all measurements. The metric name uses the _sum suffix. Optionally, a number of quantiles of measurements exposed as a gauge using the metric name with a quantile label. Since you don’t want those quantiles to be measured from the entire time an application has been running, Prometheus client libraries use streamed quantiles that are computed over a sliding time window (which is usually configurable).

For example, the summary metric to measure the response time of the instance of the add_product API endpoint running on host1.domain.com could be represented as:

```exposition-format
# HELP http_request_duration_seconds Api requests response time in seconds
# TYPE http_request_duration_seconds summary
http_request_duration_seconds_sum{api="add_product" instance="host1.domain.com"} 8953.332
http_request_duration_seconds_count{api="add_product" instance="host1.domain.com"} 27892
http_request_duration_seconds{api="add_product" instance="host1.domain.com" quantile="0"}
http_request_duration_seconds{api="add_product" instance="host1.domain.com" quantile="0.5"} 0.232227334
http_request_duration_seconds{api="add_product" instance="host1.domain.com" quantile="0.90"} 0.821139321
http_request_duration_seconds{api="add_product" instance="host1.domain.com" quantile="0.95"} 1.528948804
http_request_duration_seconds{api="add_product" instance="host1.domain.com" quantile="0.99"} 2.829188272
http_request_duration_seconds{api="add_product" instance="host1.domain.com" quantile="1"} 34.283829292

```

This example above includes the sum and count as well as five quantiles. Quantile 0 is equivalent to the minimum value and quantile 1 is equivalent to the maximum value. Quantile 0.5 is the median and quantiles 0.90, 0.95, and 0.99 correspond to the 90th, 95th, and 99th percentile of the response time for the add_product API endpoint running on host1.domain.com.

Like histograms, summaries include sum and count that can be used to compute the average of a measurement over time and across time series.

Summaries provide more accurate quantiles than histograms but those quantiles have three main drawbacks:

- First, computing the quantiles is expensive on the client-side. This is because the client library must keep a sorted list of data points overtime to make this calculation. The implementation in the Prometheus client libraries uses techniques that limit the number of data points that must be kept and sorted, which reduces accuracy in exchange for an increase in efficiency. Note that not all Prometheus client libraries support quantiles in summary metrics. For example, the Python library does not have support for it.
- Second, the quantiles you want to query must be predefined by the client. Only the quantiles for which there is a metric already provided can be returned by queries. There is no way to calculate other quantiles at query time. Adding a new quantile requires modifying the code and the metric will be available from that time forward.
- And third and most important, it’s impossible to aggregate summaries across multiple series, making them useless for most use cases in dynamic modern systems where you are interested in the view across all instances of a given component. Therefore, imagine that in our example the add_product API endpoint was running on ten hosts sitting behind a load balancer. There is no aggregation function that we could use to compute the 99th percentile of the response time of the add_product API endpoint across all requests regardless of which host they hit. We could only see the 99th percentile for each individual host. Same thing if instead of the 99th percentile of the response time for the add_product API endpoint we wanted to get the 99th percentile of the response time across all API requests regardless of which endpoint they hit.

The code below creates a summary metric using the Prometheus client library for Python:

```python
from prometheus_client import Summary
api_request_duration = Summary(
                        'http_request_duration_seconds',
                        'Api requests response time in seconds',
                        ['api', 'instance']
                       )
api_request_duration.labels(api='add_product', instance='host1.domain.com').observe(0.3672)
      
   
```

The code above does not define any quantile and would only produce sum and count metrics. The Prometheus client library for Python does not have support for quantiles in summary metrics.

## Histograms or Summaries, What Should I Use?

In most cases, histograms are preferred since they are more flexible and allow for aggregated percentiles.

Summaries are useful in cases where percentiles are not needed and averages are enough, or when very accurate percentiles are required. For example, in the case of contractual obligations for the performance of a critical system.

The table below summarizes the pros and cons of histograms and summaries.

**![histograms-vs-summaries](https://www.timescale.com/blog/content/images/size/w1000/2022/04/histogram-summary-prometheus-timescale.png)**

If you're looking for a time-series database to store your metrics, check out Timescale. You will specially love it if you're using PostgreSQL. Timescale a PostgreSQL extension that will give PostgreSQL the boost it needs to handle large volumes of metrics, will keeping your writes and queries fast via automatic partitioning, query planner enhancements, improved materialized views, columnar compression, and much more.
