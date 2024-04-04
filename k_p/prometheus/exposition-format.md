# Prometheus Exposition Format

## References

<https://github.com/Showmax/prometheus-docs/blob/master/content/docs/instrumenting/exposition_formats.md?ref=timescale.com>

## Protocol buffer format details

Reproducible sorting of the protocol buffer fields in repeated expositions is preferred but not required, i.e. do not sort if the computational cost is prohibitive.

Each MetricFamily within the same exposition must have a unique name. Each Metric within the same MetricFamily must have a unique set of LabelPair fields. Otherwise, the ingestion behavior is undefined.

## Text format details

The protocol is line-oriented. A line-feed character (\n) separates lines. The last line must end with a line-feed character. Empty lines are ignored.

Within a line, tokens can be separated by any number of blanks and/or tabs (and have to be separated by at least one if they would otherwise merge with the previous token). Leading and trailing whitespace is ignored.

Lines with a # as the first non-whitespace character are comments. They are ignored unless the first token after # is either HELP or TYPE. Those lines are treated as follows: If the token is HELP, at least one more token is expected, which is the metric name. All remaining tokens are considered the docstring for that metric name. HELP lines may contain any sequence of UTF-8 characters (after the metric name), but the backslash and the line-feed characters have to be escaped as \\ and \n, respectively. Only one HELP line may exist for the same metric name.

If the token is TYPE, exactly two more tokens are expected. The first is the metric name, and the second is either counter, gauge, histogram, summary, or untyped, defining the type for the metric of that name. Only one TYPE line may exist for the same metric name. The TYPE line for a metric name has to appear before the first sample is reported for that metric name. If there is no TYPE line for a metric name, the type is set to untyped. Remaining lines describe samples, one per line, with the following syntax (EBNF):

```ebnf
metric_name [
  "{" label_name "=" `"` label_value `"` { "," label_name "=" `"` label_value `"` } [ "," ] "}"
] value [ timestamp ]
```

metric_name and label_name have the usual Prometheus expression language restrictions. label_value can be any sequence of UTF-8 characters, but the backslash, the double-quote, and the line-feed characters have to be escaped as \\, \", and \n, respectively. value is a float, and timestamp an int64 (milliseconds since epoch, i.e. 1970-01-01 00:00:00 UTC, excluding leap seconds), represented as required by the Go strconv package (see functions ParseInt and ParseFloat). In particular, Nan, +Inf, and -Inf are valid values.

All lines for a given metric must be provided as one uninterrupted group, with the optional HELP and TYPE lines first (in no particular order). Beyond that, reproducible sorting in repeated expositions is preferred but not required, i.e. do not sort if the computational cost is prohibitive.

Each line must have a unique combination of metric name and labels. Otherwise, the ingestion behavior is undefined.

The histogram and summary types are difficult to represent in the text format. The following conventions apply:

- The sample sum for a summary or histogram named x is given as a separate sample named x_sum.
- The sample count for a summary or histogram named x is given as a separate sample named x_count.
- Each quantile of a summary named x is given as a separate sample line with the same name x and a label {quantile="y"}.
- Each bucket count of a histogram named x is given as a separate sample line with the name x_bucket and a label {le="y"} (where y is the upper bound of the bucket).

A histogram must have a bucket with {le="+Inf"}. Its value must be identical to the value of x_count.
The buckets of a histogram and the quantiles of a summary must appear in increasing numerical order of their label values (for the le or the quantile label, respectively).

See also the example below.

```exposition-format

# HELP http_requests_total The total number of HTTP requests.
# TYPE http_requests_total counter
http_requests_total{method="post",code="200"} 1027 1395066363000
http_requests_total{method="post",code="400"}    3 1395066363000

# Escaping in label values:
msdos_file_access_time_seconds{path="C:\\DIR\\FILE.TXT",error="Cannot find file:\n\"FILE.TXT\""} 1.458255915e9

# Minimalistic line:
metric_without_timestamp_and_labels 12.47

# A weird metric from before the epoch:
something_weird{problem="division by zero"} +Inf -3982045

# A histogram, which has a pretty complex representation in the text format:
# HELP http_request_duration_seconds A histogram of the request duration.
# TYPE http_request_duration_seconds histogram
http_request_duration_seconds_bucket{le="0.05"} 24054
http_request_duration_seconds_bucket{le="0.1"} 33444
http_request_duration_seconds_bucket{le="0.2"} 100392
http_request_duration_seconds_bucket{le="0.5"} 129389
http_request_duration_seconds_bucket{le="1"} 133988
http_request_duration_seconds_bucket{le="+Inf"} 144320
http_request_duration_seconds_sum 53423
http_request_duration_seconds_count 144320

# Finally a summary, which has a complex representation, too:
# HELP telemetry_requests_metrics_latency_microseconds A summary of the response latency.
# TYPE telemetry_requests_metrics_latency_microseconds summary
telemetry_requests_metrics_latency_microseconds{quantile="0.01"} 3102
telemetry_requests_metrics_latency_microseconds{quantile="0.05"} 3272
telemetry_requests_metrics_latency_microseconds{quantile="0.5"} 4773
telemetry_requests_metrics_latency_microseconds{quantile="0.9"} 9001
telemetry_requests_metrics_latency_microseconds{quantile="0.99"} 76656
telemetry_requests_metrics_latency_microseconds_sum 1.7560473e+07
telemetry_requests_metrics_latency_microseconds_count 2693

```
