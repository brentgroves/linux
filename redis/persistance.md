# Persistance

## references

<https://redis.io/docs/management/persistence/>

## Redis persistence

How Redis writes data to disk

Persistence refers to the writing of data to durable storage, such as a solid-state disk (SSD). Redis provides a range of persistence options. These include:

RDB (Redis Database): RDB persistence performs point-in-time snapshots of your dataset at specified intervals.
AOF (Append Only File): AOF persistence logs every write operation received by the server. These operations can then be replayed again at server startup, reconstructing the original dataset. Commands are logged using the same format as the Redis protocol itself.
No persistence: You can disable persistence completely. This is sometimes used when caching.
RDB + AOF: You can also combine both AOF and RDB in the same instance.
If you'd rather not think about the tradeoffs between these different persistence strategies, you may want to consider Redis Enterprise's persistence options, which can be pre-configured using a UI.

To learn more about how to evaluate your Redis persistence strategy, read on.

## RDB advantages

- RDB is a very compact single-file point-in-time representation of your Redis data. RDB files are perfect for backups. For instance you may want to archive your RDB files every hour for the latest 24 hours, and to save an RDB snapshot every day for 30 days. This allows you to easily restore different versions of the data set in case of disasters.
- RDB is very good for disaster recovery, being a single compact file that can be transferred to far data centers, or onto Amazon S3 (possibly encrypted).
- RDB maximizes Redis performances since the only work the Redis parent process needs to do in order to persist is forking a child that will do all the rest. The parent process will never perform disk I/O or alike.
RDB allows faster restarts with big datasets compared to AOF.
On replicas, RDB supports partial resynchronizations after restarts and failovers.

## RDB disadvantages

- RDB is NOT good if you need to minimize the chance of data loss in case Redis stops working (for example after a power outage). You can configure different save points where an RDB is produced (for instance after at least five minutes and 100 writes against the data set, you can have multiple save points). However you'll usually create an RDB snapshot every five minutes or more, so in case of Redis stopping working without a correct shutdown for any reason you should be prepared to lose the latest minutes of data.
- RDB needs to fork() often in order to persist on disk using a child process. fork() can be time consuming if the dataset is big, and may result in Redis stopping serving clients for some milliseconds or even for one second if the dataset is very big and the CPU performance is not great. AOF also needs to fork() but less frequently and you can tune how often you want to rewrite your logs without any trade-off on durability.

## AOF advantages

- Using AOF Redis is much more durable: you can have different fsync policies: no fsync at all, fsync every second, fsync at every query. With the default policy of fsync every second, write performance is still great. fsync is performed using a background thread and the main thread will try hard to perform writes when no fsync is in progress, so you can only lose one second worth of writes.
- The AOF log is an append-only log, so there are no seeks, nor corruption problems if there is a power outage. Even if the log ends with a half-written command for some reason (disk full or other reasons) the redis-check-aof tool is able to fix it easily.
- Redis is able to automatically rewrite the AOF in background when it gets too big. The rewrite is completely safe as while Redis continues appending to the old file, a completely new one is produced with the minimal set of operations needed to create the current data set, and once this second file is ready Redis switches the two and starts appending to the new one.
-AOF contains a log of all the operations one after the other in an easy to understand and parse format. You can even easily export an AOF file. For instance even if you've accidentally flushed everything using the FLUSHALL command, as long as no rewrite of the log was performed in the meantime, you can still save your data set just by stopping the server, removing the latest command, and restarting Redis again.

## AOF disadvantages

- AOF files are usually bigger than the equivalent RDB files for the same dataset.
- AOF can be slower than RDB depending on the exact fsync policy. In general with fsync set to every second performance is still very high, and with fsync disabled it should be exactly as fast as RDB even under high load. Still RDB is able to provide more guarantees about the maximum latency even in the case of a huge write load.

## Ok, so what should I use?

The general indication you should use both persistence methods is if you want a degree of data safety comparable to what PostgreSQL can provide you.

If you care a lot about your data, but still can live with a few minutes of data loss in case of disasters, you can simply use RDB alone.

There are many users using AOF alone, but we discourage it since to have an RDB snapshot from time to time is a great idea for doing database backups, for faster restarts, and in the event of bugs in the AOF engine.

The following sections will illustrate a few more details about the two persistence models.

## Snapshotting

By default Redis saves snapshots of the dataset on disk, in a binary file called dump.rdb. You can configure Redis to have it save the dataset every N seconds if there are at least M changes in the dataset, or you can manually call the SAVE or BGSAVE commands.

For example, this configuration will make Redis automatically dump the dataset to disk every 60 seconds if at least 1000 keys changed:

save 60 1000
This strategy is known as snapshotting.

How it works
Whenever Redis needs to dump the dataset to disk, this is what happens:

Redis forks. We now have a child and a parent process.

The child starts to write the dataset to a temporary RDB file.

When the child is done writing the new RDB file, it replaces the old one.

This method allows Redis to benefit from copy-on-write semantics.

## Append-only file

Snapshotting is not very durable. If your computer running Redis stops, your power line fails, or you accidentally kill -9 your instance, the latest data written to Redis will be lost. While this may not be a big deal for some applications, there are use cases for full durability, and in these cases Redis snapshotting alone is not a viable option.

The append-only file is an alternative, fully-durable strategy for Redis. It became available in version 1.1.

You can turn on the AOF in your configuration file:

appendonly yes
From now on, every time Redis receives a command that changes the dataset (e.g. SET) it will append it to the AOF. When you restart Redis it will re-play the AOF to rebuild the state.

Since Redis 7.0.0, Redis uses a multi part AOF mechanism. That is, the original single AOF file is split into base file (at most one) and incremental files (there may be more than one). The base file represents an initial (RDB or AOF format) snapshot of the data present when the AOF is rewritten. The incremental files contains incremental changes since the last base AOF file was created. All these files are put in a separate directory and are tracked by a manifest file.
