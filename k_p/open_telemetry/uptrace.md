# Uptrace

## **[Uptrace Open-Telemetry](https://github.com/uptrace/uptrace)**

Uptrace is an open source APM that supports distributed tracing, metrics, and logs. You can use it to monitor applications and troubleshoot issues.

Uptrace comes with an intuitive query builder, rich dashboards, alerting rules, notifications, and integrations for most languages and frameworks.

Uptrace can process billions of spans and metrics on a single server and allows you to monitor your applications at 10x lower cost.

Uptrace uses OpenTelelemetry framework to collect data and ClickHouse database to store it. Uptrace also requires PostgreSQL database to store metadata such as metric names and alerts.

Features:

- Single UI for traces, metrics, and logs.
- SQL-like query language to aggregate spans.
- Promql-like language to aggregate metrics.
- Built-in alerts with notifications via Email, Slack, WebHook, and AlertManager.
- Pre-built metrics dashboards.
- Multiple users/projects via YAML config.
- Single sign-on (SSO) using OpenID Connect: Keycloak, Google Cloud, and Cloudflare.
- Ingestion using OpenTelemetry, Vector, FluentBit, CloudWatch, and more.
- Efficient processing: more than 10K spans / second on a single core.
- Excellent on-disk compression: 1KB span can be compressed down to ~40 bytes.
