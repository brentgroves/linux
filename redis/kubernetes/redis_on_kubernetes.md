# Redis on Kubernetes

## references

<https://www.groundcover.com/blog/redis-cluster-kubernetes>

## Advantages

You know Redis, the open-source in-memory data store, and you know Kubernetes, the open source container orchestration platform. But what you might not know - and fair enough - is that you can use Redis and Kubernetes together. Traditionally, most Redis deployments have not involved Kubernetes, and vice versa.

That certainly doesn't mean, however, that you can't combine Redis with Kubernetes – or that there are no clear advantages to doing so. By deploying Redis on Kubernetes, you can easily set up a Redis cluster, which provides reliability and performance benefits that you wouldn't get from a conventional, single-node Redis environment.

This article walks through the what, why and how of setting up a Redis cluster on Kubernetes. It explains how Redis works, what the benefits (and concerns) of running Redis on Kubernetes are and tips and best practices for getting the most out of a Kubernetes-based Redis deployment.

## What is a Redis cluster?

Let's start with the basics by defining what we mean when we talk about Redis clusters.

A Redis cluster is a set of multiple Redis instances. In other words, with a Redis cluster, you have multiple nodes hosting your Redis data stores. Data is "sharded" between the nodes, meaning that the data is broken into smaller chunks and distributed across the various nodes.

![](https://assets-global.website-files.com/626a25d633b1b99aa0e1afa7/639f3e566949fbd29bbad828_kTy3ttGy4TQqqfStNFKBnczSL9P-xh8tCVgudnR4Q3S7z1cn-_8pwA549fMLFEyKHnukY7errnvdyDwVoxO3siX85YJxFsvlW4BVLsf4lvjyJLVn6-sLM7T-jm90Os-06DeCQTDmu-pn3zP98qus92JesUr3XIairOHs__xFT7oncMHAWdNva0Sm9w5XSA.png)

That's significant because historically, Redis wasn't designed for clustering or data sharding. Unlike certain other types of databases, like Apache Cassandra, Redis isn't a distributed database that is supposed to operate in a clustered environment. Redis's big selling-point is that it stores data in-memory, which can dramatically boost performance compared to disk-based storage.

So, by creating a Redis cluster, you're piling extra benefits on top of Redis's core functionality. In particular, you get added reliability, because your Redis data store will remain operational even if some nodes fail. You may also get better performance in some cases because load can be distributed between nodes, which helps to avoid the bottlenecks that could result if a single application or request were to monopolize access to a Redis node.

## Redis Cluster vs. Redis Sentinel

If you're familiar with Redis, you may know that there's another way to achieve some of the reliability features mentioned above. It's called Redis Sentinel, and it provides automated failover between multiple Redis instances. Sentinel also supports monitoring and notifications to help admins detect availability issues quickly.

However, Sentinel is different from setting up a cluster where you have multiple Redis instances with data sharded between them. Sentinel is essentially a way to run Redis in high-availability mode by taking advantage of automated failover, which is different from distributing data across multiple nodes within a cluster.

In general, Sentinel is useful if you have a relatively small-scale Redis environment and you want a simple means of increasing its availability. But to maximize availability at scale, setting up a Redis cluster is a better approach.

## How Redis clusters work on KubernSetes

Now, let's talk about how Kubernetes figures into Redis clustering. To be clear, you don't need to use Kubernetes to create a Redis cluster. You can set up a Redis cluster using any set of servers, even if they are not managed by Kubernetes.

That said, operating a Redis cluster on top of Kubernetes provides some benefits that you wouldn't get from other approaches:

- You can horizontally scale Redis deployments across multiple nodes in Kubernetes, which leads to the best performance and availability. Horizontal scaling is harder to do without the help of Kubernetes, whose core purpose includes scaling workloads horizontally.
- You get automated self-healing and rolling updates for your Redis instances, making it easier to keep your environment running.

On top of this, running a Redis cluster on Kubernetes allows you to use Kubernets-native tooling – like Helm charts and kubectl – to manage your environment. That's an advantage if you already know Kubernetes, and/or you have other workloads running on Kubernetes. By integrating Redis with Kubernetes, you centralize your tooling and simplify your management overhead.

## Setting up a Redis cluster on Kubernetes

Actually setting up a Redis cluster on top of Kubernetes is easy enough. Here are the steps.

1. Set up Kubernetes. As a preliminary step, you need to deploy Kubernetes. We won't walk through how to do that here, but suffice it to say that you can run Kubernetes locally using a tool like K3s, or you can deploy it on a set of servers. You can also use a cloud-based managed Kubernetes service, like Amazon EKS, which simplifies the setup process because the control plane software is provided for you.

This is an old article now we can use a **[Redis Operator](./operator/redis_operator.md)** to deploy redis.

2.Create a StatefulSet. Next, you need to create a StatefulSet. A StatefulSet is a workload object that makes it possible to deploy Pods (which host Kubernetes workloads) with unique identifiers – which you don't get from a standard Kubernetes deployment. If you're running a database or data store like Redis, having a unique identifier for each Pod is important because it allows you to keep Pods connected to a specific database even if the Pods fail and are restarted, or if they move to a different node. Without a StatefulSet, you'd have no way to establish persistent links between Pods and data stores.

So, set up a StatefulSet to manage the nodes in your Redis cluster. Be sure to specify the number of replicas you want for the Pods and the container image to use. Here's an example with the minimum configuration you'd need:

```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: redis-cluster
  namespace: redis-namespace
spec:
  serviceName: redis-cluster-service
  replicas: 9
  selector:
 matchLabels:
   app: redis-cluster
```

To create the StatefulSet, save the configuration to a file and deploy it with a command like:

```bash
kubectl create -f redis.yaml
```

3.Create a Service.
You also need to set up a Service resource. This provides a network endpoint that you can use to access the Redis cluster. The Service should have a ClusterIP, and it should use the StatefulSet you created above as its endpoint source. For example:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: redis-cluster
  namespace: redis-namespace
spec:
  type: ClusterIP
  ports:
  - port: 6379
 targetPort: 6379
 name: client
  selector:
 app: redis-cluster
```

4.Start the cluster
With the StatefulSet and Service running, your Redis cluster should be running. To do this, you must first find the ClusterIP of your Redis nodes. You can do this using a command like the following (assuming the nodes run on port 6379, which is the default Redis port):

```bash
export REDIS_NODES=$(kubectl get pods  -l app=redis-cluster -n redis -o json | jq -r '.items | map(.status.podIP) | join(":6379 ")'):6379
```

<https://www.devtoolsdaily.com/jq/examples/map/>
<https://qmacro.org/blog/posts/2022/06/23/understanding-jq's-sql-style-operators-join-and-index/>

You can then connect to your cluster by calling the redis-cli tool through kubectl:

```bash
kubectl exec -it redis-cluster-0 -n redis -- redis-cli --cluster create --cluster-replicas 1 ${REDIS_NODES}
```

## Redis cluster caveats

Although there are good reasons to run a Redis cluster on Kubernetes, as we explained above, there are also some potential limitations and caveats to be aware of when running this type of environment:

- Command limitations: Redis doesn't support all Redis commands in cluster mode. For example, SELECT is not allowed. For details on command limitations for Redis clusters, check out the Redis documentation.
- Data migration: Redis clusters support features like replicas migration, which makes it possible to modify relationships between nodes within a Redis cluster, but they don't support automatic data migration between nodes. Therefore, if you want to add or remove a node from the cluster entirely, you'll need to do so manually. You can't simply shut down a node and expect Redis to move its data somewhere else on its own. Nor can you add a new node and expect Redis to move data to it in an automated, optimal way.
- Key distribution: In cluster mode, Redis uses a hashing algorithm to distribute keys (which identify data inside Redis data stores) across nodes. This feature is useful in most cases because it helps to balance keys automatically, but in some scenarios, you can end up with uneven key distribution due to bad decisions by the algorithm. Uneven key distribution can cause an imbalance in load between nodes, which may lead to performance issues.
- Network limitations: Redis relies on a gossip protocol (through which nodes periodically report their state to other nodes) to allow nodes to discover each other, and to detect node failures. This protocol usually works well, but you may run into problems if your network performs poorly and exchange of the state messages between nodes is slow. You're also likely to encounter issues if your network is partitioned in a complex way that prevents direct communication between nodes.

<http://highscalability.com/blog/2023/7/16/gossip-protocol-explained.html>

The gossip protocol is a decentralized peer-to-peer communication technique to transmit messages in an enormous distributed system [1], [8]. The key concept of gossip protocol is that every node periodically sends out a message to a subset of other random nodes [8], [2]. The entire system will receive the particular message eventually with a high probability [11], [3]. In layman’s terms, the gossip protocol is a technique for nodes to build a global map through limited local interactions [1].

![](https://i.imgur.com/1Nu8HXN.gif?__SQUARESPACE_CACHEVERSION=1689515298461)

- Multi-key transactions: There's no way to run transactions across multiple keys in Redis. As a result, it's important to be careful when designing applications to avoid inconsistencies.

For the record, none of these limitations are specific to Redis clusters running on Kubernetes. They apply to Redis clusters in any type of setup. So these are not reasons to avoid setting up a Redis cluster on Kubernetes in particular, but they are challenges that you should be aware of if you decide to run Redis on Kubernetes.

## Kubernetes helps to double-down on the value provided by Redis

By running a Redis cluster on Kubernetes, you get simplified horizontal scaling, self-healing, rolling updates and a centralized tooling stack, while also enjoying the performance that Redis delivers through in-memory data storage.

That said, there are limitations on what you can do with a Redis cluster. You can't run certain commands, and you may run into key distribution and node discovery issues in some cases, among other challenges. If you decide to take advantage of Kubernetes as a way to run a Redis cluster, be sure to plan for these potential limitations.
