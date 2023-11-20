# Prometheus getting started

## References

<https://prometheus.io/docs/prometheus/latest/getting_started/>
<https://prometheus.io/download/>
<https://github.com/prometheus/prometheus>

## Prometheus

<https://github.com/prometheus/prometheus>
Prometheus, a Cloud Native Computing Foundation project, is a systems and service monitoring system. It collects metrics from configured targets at given intervals, evaluates rule expressions, displays the results, and can trigger alerts when specified conditions are observed.

The features that distinguish Prometheus from other metrics and monitoring systems are:

A multi-dimensional data model (time series defined by metric name and set of key/value dimensions)
PromQL, a powerful and flexible query language to leverage this dimensionality
No dependency on distributed storage; single server nodes are autonomous
An HTTP pull model for time series collection
Pushing time series is supported via an intermediary gateway for batch jobs
Targets are discovered via service discovery or static configuration
Multiple modes of graphing and dashboarding support
Support for hierarchical and horizontal federation

- **![Architecture Overview](https://github.com/prometheus/prometheus/blob/main/documentation/images/architecture.svg)**

## Getting Started

This guide is a "Hello World"-style tutorial which shows how to install, configure, and use a simple Prometheus instance. You will download and run Prometheus locally, configure it to scrape itself and an example application, then work with queries, rules, and graphs to use collected time series data.

## Downloading and running Prometheus

Docker images
Docker images are available on Quay.io or Docker Hub.

You can launch a Prometheus container for trying it out with

docker run --name prometheus -d -p 127.0.0.1:9090:9090 prom/prometheus
Prometheus will now be reachable at <http://localhost:9090/>.

<https://prometheus.io/download/>
Download the latest release of Prometheus for your platform, then extract and run it:

tar xvfz prometheus-*.tar.gz
cd prometheus-*
Before starting Prometheus, let's configure it.

## Configuring Prometheus to monitor itself

Prometheus collects metrics from targets by scraping metrics HTTP endpoints. Since Prometheus exposes data in the same manner about itself, it can also scrape and monitor its own health.

While a Prometheus server that collects only data about itself is not very useful, it is a good starting example. Save the following basic Prometheus configuration as a file named prometheus.yml:

For a complete specification of configuration options, see the configuration **[documentation](https://prometheus.io/docs/prometheus/latest/configuration/configuration/)**

Starting Prometheus
To start Prometheus with your newly created configuration file, change to the directory containing the Prometheus binary and run:

## Start Prometheus

### By default, Prometheus stores its database in ./data (flag --storage.tsdb.path)

```bash
cd ~
wget https://github.com/prometheus/prometheus/releases/download/v2.45.1/prometheus-2.45.1.linux-amd64.tar.gz 
tar xvfz prometheus-*.tar.gz
cd prometheus-*
cp ~/src/repsys/linux/prometheus/prometheus.yaml .
./prometheus --config.file=prometheus.yaml
```

Prometheus should start up. You should also be able to browse to a status page about itself at **[localhost:9090](http://localhost:9090)**. Give it a couple of seconds to collect data about itself from its own HTTP metrics endpoint.

You can also verify that Prometheus is serving metrics about itself by navigating to its metrics endpoint: **[localhost:9090/metrics](http://localhost:9090/metrics)**

## Using the expression browser

Let us explore data that Prometheus has collected about itself. To use Prometheus's built-in expression browser, navigate to **[http://localhost:9090/graph](http://localhost:9090/graph)** and choose the "Table" view within the "Graph" tab.

As you can gather from localhost:9090/metrics, one metric that Prometheus exports about itself is named prometheus_target_interval_length_seconds (the actual amount of time between target scrapes). Enter the below into the expression console and then click "Execute":

```PromQL
prometheus_target_interval_length_seconds

prometheus_target_interval_length_seconds{instance="localhost:9090", interval="15s", job="prometheus", quantile="0.01"}
14.992419325
prometheus_target_interval_length_seconds{instance="localhost:9090", interval="15s", job="prometheus", quantile="0.05"}
14.997617115
prometheus_target_interval_length_seconds{instance="localhost:9090", interval="15s", job="prometheus", quantile="0.5"}
14.999995303
prometheus_target_interval_length_seconds{instance="localhost:9090", interval="15s", job="prometheus", quantile="0.9"}
15.001414484
prometheus_target_interval_length_seconds{instance="localhost:9090", interval="15s", job="prometheus", quantile="0.99"}
```

This should return a number of different time series (along with the latest value recorded for each), each with the metric name prometheus_target_interval_length_seconds, but with different labels. These labels designate different latency percentiles and target group intervals.
If we are interested only in 99th percentile latencies, we could use this query:

```PromQL
prometheus_target_interval_length_seconds{quantile="0.99"}
```

To count the number of returned time series, you could write:

```PromQL
count(prometheus_target_interval_length_seconds)
```

For more about the expression language, see the **[expression language documentation](https://prometheus.io/docs/prometheus/latest/querying/basics/)**.

## Using the graphing interface

To graph expressions, navigate to <http://localhost:9090/graph> and use the "Graph" tab.

For example, enter the following expression to graph the per-second rate of chunks being created in the self-scraped Prometheus:

rate(prometheus_tsdb_head_chunks_created_total[1m])
Experiment with the graph range parameters and other settings.

## Starting up some sample targets

Let's add additional targets for Prometheus to scrape.

The Node Exporter is used as an example target, for more information on using it see these instructions.

Installing and running the Node Exporter
The Prometheus Node Exporter is a single static binary that you can install via tarball. Once you've downloaded it from the Prometheus downloads page extract it, and run it:

```bash
# NOTE: Replace the URL with one from the above mentioned "downloads" page.
# <VERSION>, <OS>, and <ARCH> are placeholders.
wget "https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz"
tar xvfz node_exporter-*.*-amd64.tar.gz
cd node_exporter-*.*-amd64
# Start 3 example targets in separate terminals:
./node_exporter --web.listen-address 127.0.0.1:8080
./node_exporter --web.listen-address 127.0.0.1:8081
./node_exporter --web.listen-address 127.0.0.1:8082

```

You should now have example targets listening on <http://localhost:8080/metrics>, <http://localhost:8081/metrics>, and <http://localhost:8082/metrics>.

Configure Prometheus to monitor the sample targets
Now we will configure Prometheus to scrape these new targets. Let's group all three endpoints into one job called node. We will imagine that the first two endpoints are production targets, while the third one represents a canary instance. To model this in Prometheus, we can add several groups of endpoints to a single job, adding extra labels to each group of targets. In this example, we will add the group="production" label to the first group of targets, while adding group="canary" to the second.

To achieve this, add the following job definition to the scrape_configs section in your prometheus.yml and restart your Prometheus instance:

```yaml
scrape_configs:
  - job_name:       'node'

    # Override the global default and scrape targets from this job every 5 seconds.
    scrape_interval: 5s

    static_configs:
      - targets: ['localhost:8080', 'localhost:8081']
        labels:
          group: 'production'

      - targets: ['localhost:8082']
        labels:
          group: 'canary'

```

Go to the expression browser and verify that Prometheus now has information about time series that these example endpoints expose, such as node_cpu_seconds_total.
