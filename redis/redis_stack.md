# Redis Stack

## references

<https://www.hostinger.com/tutorials/how-to-install-and-setup-redis-on-ubuntu/>

<https://www.youtube.com/watch?v=PDrqZgAWHo0>

<https://redis.io/docs/about/about-stack/>

## About Redis Stack

Learn more about Redis Stack

Redis Stack is the best starting point for working with Redis. We've bundled together the best of the technology that we have to offer into an easy-to-use package. Redis Stack extends the core features of Redis OSS and provides a complete developer experience for debugging and more.

In addition to all of the features of Redis OSS, Redis Stack supports:

Probabilistic data structures
Queryable JSON documents
Querying across hashes and JSON documents
Time series data support (ingestion & querying), including full-text search

## Why Redis Stack?

Redis Stack was created to allow developers to build real-time applications with a backend data platform that can reliably process requests in milliseconds or less. Redis Stack does this by taking the original Redis OSS as the core and enhancing it with modern data models, data processing tools, and continuing to fight complexity at every turn. Ultimately, the goal of Redis Stack is to build a real-time data platform that continues to fulfill the philosophy of Redis OSS: simplicity, performance, and reliability.

Redis Stack unifies and simplifies the developer experience of Redis by offering all the cutting-edge features provided by the leading Redis features. Redis Stack bundles the following features into Redis: JSON, Search and Query, Time Series, and Probabilistic.

The overarching vision is to provide developers with a powerful platform for all real-time data use cases. As we continue to advance the features of Redis beyond caching, Redis Stack is the place to start. Redis Stack delivers the core features developers love about Redis and goes beyond to help you build modern applications where performance is paramount.

## Redis Stack packaging

There are two distinct Redis Stack packages to choose from:

Redis Stack Server: This package contains Redis OSS and module extensions only. It does not contain RedisInsight, the developer desktop application. This package is best for production deployment and is intended to be a drop-in replacement (for example, if you're already deploying Redis OSS as a cache). You can still download RedisInsight separately.

Redis Stack: This package contains everything a developer needs in a single bundle. This includes Redis Stack Server (Redis OSS and module extensions) along with the RedisInsight desktop application (or part of the docker container). If you want to create an application locally and explore how it interacts with Redis, this is the package for you.

## Use cases

<https://redis.io/docs/interact/search-and-query/query-use-cases/>

Search and query use cases

Application search and external secondary index

Redis Stack supports application search, whether the source of record is Redis or another database. In the latter case, you can use Redis Stack as an external secondary index for numeric or full-text data.

Secondary index for Redis data

You can represent your data model using Redis hashes and JSON documents. You can then declare secondary indexes to support various queries on your data set. Redis Stack updates indexes automatically whenever a hash or JSON document that matches the indexes is added or updated.

## Clients

Several Redis client libraries support Redis Stack. These include redis-py, node_redis, NRedisStack, and Jedis. In addition, four higher-level object mapping libraries also support Redis Stack: Redis OM .NET, Redis OM Node, Redis OM Python, Redis OM Spring.
