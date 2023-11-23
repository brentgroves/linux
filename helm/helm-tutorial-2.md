# Helm tutorial

## references

https://www.baeldung.com/ops/kubernetes-helm

## Helm Architecture
Helm has undergone a significant architecture uplift as part of Helm 3. It has some of the significant and long-awaited changes as compared to Helm 2. Apart from packing a new set of capabilities, Helm 3 also features changes in its internal plumbing. We’ll examine some of these changes.

Helm 2 was primarily on a client-server architecture that comprises of a client and an in-cluster server:

 **![architecture](https://www.baeldung.com/wp-content/uploads/sites/6/2023/03/Helm-2-Architecture-768x286.webp)**

- Tiller Server: Helm manages the Kubernetes application through Tiller Server installed within a Kubernetes cluster. Tiller interacts with the Kubernetes API server to install, upgrade, query, and remove Kubernetes resources.
- Helm Client: Helm provides a command-line interface for users to work with Helm Charts. It is responsible for interacting with the Tiller server to perform various operations like install, upgrade and rollback charts.

Helm 3 has moved onto a completely client-only architecture, where the in-cluster server has been removed:

**![helm 3](https://www.baeldung.com/wp-content/uploads/sites/6/2023/03/Helm-3-Architecture-768x287.webp)**

As we can see, the client in Helm 3 works pretty much the same but interacts directly with the Kubernetes API server instead of the Tiller server. This move has simplified the architecture of Helm and allowed it to leverage the Kubernetes user cluster security.

## Helm Charts, Releases, and Repositories

Helm manages Kubernetes resource packages through Charts. Charts are basically the packaging format for Helm. The chart infrastructure has also gone some changes as part of Helm 3 compared to Helm 2.

We’ll see more about charts and the changes in Helm 3 as we create them shortly. But for now, a chart is nothing but a set of information necessary to create a Kubernetes application, given a Kubernetes cluster:

- A chart is a collection of files organized in a specific directory structure
- The configuration information related to a chart is managed in the configuration
- Finally, a running instance of a chart with a specific config is called a release

Helm 3 also introduced the concept of library charts. Basically, library charts enable support for common charts that we can use to define chart primitives or definitions. This can help to share snippets of code that we can re-use across charts.

Helm tracks an installed chart in the Kubernetes cluster using releases. This allows us to install a single chart multiple times with different releases in a cluster. Until Helm 2, releases were stored as ConfigMaps or Secrets in the cluster under the Tiller namespace. Starting with Helm 3, releases are stored as Secrets by default in the namespace of the release directly.

Finally, we can share charts as archives through repositories. It is basically a location where packages charts can be stored and shared. There is a distributed community chart repository by the name Artifact Hub where we can collaborate. We can also create our own private chart repositories. We can add any number of chart repositories to work with.

Before proceeding further, we should ensure that the Kubernetes cluster is running and accessible using the kubectl command:

kubectl cluster-info
Now, until Helm 2, it was also necessary to initialize Helm. This effectively installs the Tiller server and sets up the Helm state onto a Kubernetes cluster. We could initialize Helm through the Helm CLI using the command:

helm init

But, starting with Helm 3, since there is no more Tiller server, it’s unnecessary to initialize Helm. In fact, this command has been removed. Consequently, the Helm state is created automatically when required.

## Developing Our First Chart

Now we are ready to develop our first Helm Chart with templates and values. We’ll use the Helm CLI that was installed earlier to perform some of the common activities related to a chart.

## Creating a Chart

The first step, of course, would be to create a new chart with a given name:

```bash
pushd .
cd ~/src/repsys/linux/helm/
helm create hello-world
# Let’s quickly see the directory structure created for us:
tree .
hello-world /
  Chart.yaml
  values.yaml
  templates /
  charts /
  .helmignore
```

Please note that the name of the chart provided here will be the directory’s name where the chart is created and stored.



