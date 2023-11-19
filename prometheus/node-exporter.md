# MONITORING LINUX HOST METRICS WITH THE NODE EXPORTER

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
./node_exporter
```