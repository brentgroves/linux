# MONITORING LINUX HOST METRICS WITH THE NODE EXPORTER

## references

<https://prometheus.io/docs/prometheus/latest/getting_started/>
<https://prometheus.io/docs/guides/node-exporter/>

## Node Exporter

The Prometheus Node Exporter exposes a wide variety of hardware- and kernel-related metrics.

In this guide, you will:

Start up a Node Exporter on localhost
Start up a Prometheus instance on localhost that's configured to scrape metrics from the running Node Exporter

NOTE: While the Prometheus Node Exporter is for *nix systems, there is the Windows exporter for Windows that serves an analogous purpose.

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
# Start prometheus
./prometheus --config.file=prometheus.yaml   
# open browser
0.0.0.0:9090
```

## Node Exporter metrics

Once the Node Exporter is installed and running, you can verify that metrics are being exported by cURLing the /metrics endpoint:

```bash
curl http://localhost:8080/metrics
```

You should see output like this:

```exposition-format
# HELP go_gc_duration_seconds A summary of the GC invocation durations.
# TYPE go_gc_duration_seconds summary
go_gc_duration_seconds{quantile="0"} 3.8996e-05
go_gc_duration_seconds{quantile="0.25"} 4.5926e-05
go_gc_duration_seconds{quantile="0.5"} 5.846e-05
# etc.
```

Success! The Node Exporter is now exposing metrics that Prometheus can scrape, including a wide variety of system metrics further down in the output (prefixed with node_). To view those metrics (along with help and type information):

```bash
curl http://localhost:8080/metrics | grep "node_"
```

## Configuring your Prometheus instances

Your locally running Prometheus instance needs to be properly configured in order to access Node Exporter metrics. The following prometheus.yml example configuration file will tell the Prometheus instance to scrape, and how frequently, from the Node Exporter via localhost:9100:

```node-exporter
global:
  scrape_interval: 15s

scrape_configs:
- job_name: node
  static_configs:
  - targets: ['localhost:9100']
```  

To install Prometheus, download the latest release for your platform and untar it:

```bash
wget https://github.com/prometheus/prometheus/releases/download/v*/prometheus-*.*-amd64.tar.gz
tar xvf prometheus-*.*-amd64.tar.gz
cd prometheus-*.*
Once Prometheus is installed you can start it up, using the --config.file flag to point to the Prometheus configuration that you created above:

./prometheus --config.file=./prometheus.yml
```

## Exploring Node Exporter metrics through the Prometheus expression browser

Now that Prometheus is scraping metrics from a running Node Exporter instance, you can explore those metrics using the Prometheus UI (aka the expression browser). Navigate to localhost:9090/graph in your browser and use the main expression bar at the top of the page to enter expressions. The expression bar looks like this:

**![Expression Browser](https://prometheus.io/assets/prometheus-expression-bar.png)**

Metrics specific to the Node Exporter are prefixed with node_and include metrics like node_cpu_seconds_total and node_exporter_build_info.

Click on the links below to see some example metrics:

## Metric Meaning

- **[rate(node_cpu_seconds_total{mode="system"}[1m])](http://localhost:9090/graph?g0.range_input=1h&g0.expr=rate(node_cpu_seconds_total%7Bmode%3D%22system%22%7D%5B1m%5D)&g0.tab=1)**  The average amount of CPU time spent in system mode, per second, over the last minute (in seconds)

```exposition-format
{cpu="0", group="canary", instance="localhost:8082", job="node", mode="system"}
0.033818181818184134
{cpu="0", group="production", instance="localhost:8080", job="node", mode="system"}
0.03345454545454397
{cpu="0", group="production", instance="localhost:8081", job="node", mode="system"}
0.033454545454543974
{cpu="1", group="canary", instance="localhost:8082", job="node", mode="system"}
0.02563636363636099
{cpu="1", group="production", instance="localhost:8080", job="node", mode="system"}
0.025636363636365123
{cpu="1", group="production", instance="localhost:8081", job="node", mode="system"}
0.02563636363636513
{cpu="2", group="canary", instance="localhost:8082", job="node", mode="system"}
0.026000000000001158
{cpu="2", group="production", instance="localhost:8080", job="node", mode="system"}
0.02563636363636099
{cpu="2", group="production", instance="localhost:8081", job="node", mode="system"}
0.02581818181817901
{cpu="3", group="canary", instance="localhost:8082", job="node", mode="system"}
0.02527272727272909
{cpu="3", group="production", instance="localhost:8080", job="node", mode="system"}
0.02545454545454297
{cpu="3", group="production", instance="localhost:8081", job="node", mode="system"}
0.025090909090906943
```

- **[node_filesystem_avail_bytes](http://localhost:9090/graph?g0.range_input=1h&g0.expr=node_filesystem_avail_bytes&g0.tab=1)** The filesystem space available to non-root users (in bytes)

```exposition-format

node_filesystem_avail_bytes{device="/dev/sda2", fstype="vfat", group="canary", instance="localhost:8082", job="node", mountpoint="/boot/efi"}
530464768
node_filesystem_avail_bytes{device="/dev/sda2", fstype="vfat", group="production", instance="localhost:8080", job="node", mountpoint="/boot/efi"}
530464768
node_filesystem_avail_bytes{device="/dev/sda2", fstype="vfat", group="production", instance="localhost:8081", job="node", mountpoint="/boot/efi"}
530464768
node_filesystem_avail_bytes{device="/dev/sda3", fstype="ext4", group="canary", instance="localhost:8082", job="node", mountpoint="/"}
414296477696
node_filesystem_avail_bytes{device="/dev/sda3", fstype="ext4", group="canary", instance="localhost:8082", job="node", mountpoint="/var/snap/firefox/common/host-hunspell"}
414296477696
node_filesystem_avail_bytes{device="/dev/sda3", fstype="ext4", group="production", instance="localhost:8080", job="node", mountpoint="/"}
414296465408
node_filesystem_avail_bytes{device="/dev/sda3", fstype="ext4", group="production", instance="localhost:8080", job="node", mountpoint="/var/snap/firefox/common/host-hunspell"}
414296465408
node_filesystem_avail_bytes{device="/dev/sda3", fstype="ext4", group="production", instance="localhost:8081", job="node", mountpoint="/"}
```

- **[rate(node_network_receive_bytes_total[1m])](http://localhost:9090/graph?g0.range_input=1h&g0.expr=rate(node_network_receive_bytes_total%5B1m%5D)&g0.tab=1)** The average network traffic received, per second, over the last minute (in bytes)

```exposition-format
{device="docker0", group="production", instance="localhost:8081", job="node"}
0
{device="enp0s25", group="canary", instance="localhost:8082", job="node"}
2108.8727272727274
{device="enp0s25", group="production", instance="localhost:8080", job="node"}
2017.6545454545453
{device="enp0s25", group="production", instance="localhost:8081", job="node"}
2032.3454545454545
{device="lo", group="canary", instance="localhost:8082", job="node"}
10652.181818181818
{device="lo", group="production", instance="localhost:8080", job="node"}
10636.454545454544
{device="lo", group="production", instance="localhost:8081", job="node"}
10646.781818181818
{device="vethf2b0d6c", group="canary", instance="localhost:8082", job="node"}
0
{device="vethf2b0d6c", group="production", instance="localhost:8080", job="node"}
0
{device="vethf2b0d6c", group="production", instance="localhost:8081", job="node"}
0

```
