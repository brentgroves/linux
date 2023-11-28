# Histograms

Histograms and summaries are more complex metric types. Not only does a single histogram or summary create a multitude of time series, it is also more difficult to use these metric types correctly. This section helps you to pick and configure the appropriate metric type for your use case.

## references

<https://andykuszyk.github.io/2020-07-24-prometheus-histograms.html>

## Library support

First of all, check the library support for histograms and summaries.

Some libraries support only one of the two types, or they support summaries only in a limited fashion (lacking quantile calculation).

## Prometheus Histograms. Run that past me again?

I recently found myself in the position where I needed to do some detailed analysis of how long things were taking in a distributed software system. This is a solved problem from the community’s point of view with tools like Prometheus.

This blog post assumes you are familiar with the different types of metric Prometheus has to offer and are aware of the fact that real-time, dynamic values can be measured using histograms or summaries.
