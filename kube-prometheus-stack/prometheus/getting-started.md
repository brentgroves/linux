# Prometheus getting started

## References

https://prometheus.io/docs/prometheus/latest/getting_started/
https://prometheus.io/download/
https://github.com/prometheus/prometheus

## Prometheus

https://github.com/prometheus/prometheus
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
Prometheus will now be reachable at http://localhost:9090/.

https://prometheus.io/download/
Download the latest release of Prometheus for your platform, then extract and run it:

tar xvfz prometheus-*.tar.gz
cd prometheus-*
Before starting Prometheus, let's configure it.
