# PromQL

Prometheus provides a functional query language called PromQL (Prometheus Query Language) that lets the user select and aggregate time series data in real time. The result of an expression can either be shown as a graph, viewed as tabular data in Prometheus's expression browser, or consumed by external systems via the HTTP API.

## References

https://prometheus.io/docs/prometheus/latest/querying/basics/
https://prometheus.io/docs/prometheus/latest/querying/examples/

## Expression language data types

In Prometheus's expression language, an expression or sub-expression can evaluate to one of four types:

Instant vector - a set of time series containing a single sample for each time series, all sharing the same timestamp
Range vector - a set of time series containing a range of data points over time for each time series
Scalar - a simple numeric floating point value
String - a simple string value; currently unused
Depending on the use-case (e.g. when graphing vs. displaying the output of an expression), only some of these types are legal as the result from a user-specified expression. For example, an expression that returns an instant vector is the only type that can be directly graphed.

## Literals

String literals
Strings may be specified as literals in single quotes, double quotes or backticks.

PromQL follows the same escaping rules as Go. In single or double quotes a backslash begins an escape sequence, which may be followed by a, b, f, n, r, t, v or \. Specific characters can be provided using octal (\nnn) or hexadecimal (\xnn, \unnnn and \Unnnnnnnn).

No escaping is processed inside backticks. Unlike Go, Prometheus does not discard newlines inside backticks.

Example:

"this is a string"
'these are unescaped: \n \\ \t'
`these are not unescaped: \n ' " \t`

## Float literals

Scalar float values can be written as literal integer or floating-point numbers in the format (whitespace only included for better readability):

```bnf
[-+]?(
      [0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?
    | 0[xX][0-9a-fA-F]+
    | [nN][aA][nN]
    | [iI][nN][fF]
)
```

Examples:

23
-2.43
3.4e-9
0x8f
-Inf
NaN

## Time series Selectors

## Instant vector selectors

Instant vector selectors allow the selection of a set of time series and a single sample value for each at a given timestamp (instant): in the simplest form, only a metric name is specified. This results in an instant vector containing elements for all time series that have this metric name.

This example selects all time series that have the http_requests_total metric name:

```PromQL
http_requests_total
```

It is possible to filter these time series further by appending a comma separated list of label matchers in curly braces ({}).
This example selects only those time series with the http_requests_total metric name that also have the job label set to prometheus and their group label set to canary:

```PromQL
http_requests_total{job="prometheus",group="canary"}
```

It is also possible to negatively match a label value, or to match label values against regular expressions. The following label matching operators exist:

=: Select labels that are exactly equal to the provided string.
!=: Select labels that are not equal to the provided string.
=~: Select labels that regex-match the provided string.
!~: Select labels that do not regex-match the provided string.
Regex matches are fully anchored. A match of env=~"foo" is treated as env=~"^foo$".

For example, this selects all http_requests_total time series for staging, testing, and development environments and HTTP methods other than GET.

```PromQL
http_requests_total{environment=~"staging|testing|development",method!="GET"}
```

## Using the graphing interface

To graph expressions, navigate to http://localhost:9090/graph and use the "Graph" tab.

For example, enter the following expression to graph the per-second rate of chunks being created in the self-scraped Prometheus:

```PromQL
rate(prometheus_tsdb_head_chunks_created_total[1m])
```

Experiment with the graph range parameters and other settings.

Starting up some sample targets
Let's add additional targets for Prometheus to scrape.

The Node Exporter is used as an example target, for more information on using it **[see these instructions](https://prometheus.io/docs/guides/node-exporter/)**.

tar -xzvf node_exporter-*.*.tar.gz
cd node_exporter-*.*

# Start 3 example targets in separate terminals:
./node_exporter --web.listen-address 127.0.0.1:8080
./node_exporter --web.listen-address 127.0.0.1:8081
./node_exporter --web.listen-address 127.0.0.1:8082
You should now have example targets listening on http://localhost:8080/metrics, http://localhost:8081/metrics, and http://localhost:8082/metrics.




