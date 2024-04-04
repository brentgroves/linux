# Backup

## references

<https://stackoverflow.com/questions/46348758/prometheus-export-import-data-for-backup>

Since Prometheus version 2.1 it is possible to ask the server for a snapshot. The documentation provides more details - <https://web.archive.org/web/20200101000000/https://prometheus.io/docs/prometheus/2.1/querying/api/#snapshot>

Once a snapshot is created, it can be copied somewhere for safe keeping and if required a new server can be created using this snapshot as its database.

The documentation website constantly changes all the URLs, this links to fairly recent documentation on this - <https://prometheus.io/docs/prometheus/latest/querying/api/#tsdb-admin-apis>

There is an option to enable Prometheus data replication to remote storage backend. Later the data collected from multiple Prometheus instances could be backed up in one place on the remote storage backend. See, for example, how VictoriaMetrics remote storage can save time and network bandwidth when creating backups to S3 or GCS with **[vmbackup utility](https://medium.com/@valyala/speeding-up-backups-for-big-time-series-databases-533c1a927883)**.
