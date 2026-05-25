# Helm tutorial

## references

https://www.baeldung.com/ops/kubernetes-helm
https://docs.bitnami.com/tutorials/production-ready-charts/

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

Let’s understand the relevance of these files and folders created for us:

- Chart.yaml: This is the main file that contains the description of our chart
- values.yaml: this is the file that contains the default values for our chart
- templates: This is the directory where Kubernetes resources are defined as templates
- charts: This is an optional directory that may contain sub-charts
- .helmignore: This is where we can define patterns to ignore when packaging (similar in concept to .gitignore)

## Creating Template

If we see inside the template directory, we’ll notice that few templates for common Kubernetes resources have already been created for us:

```bash
hello-world /
  templates /
    deployment.yaml
    service.yaml
    ingress.yaml
    ......
```    

We may need some of these and possibly other resources in our application, which we’ll have to create ourselves as templates.

For this tutorial, we’ll create a deployment and service to expose that deployment. Please note that the emphasis here is not to understand Kubernetes in detail. Hence we’ll keep these resources as simple as possible.

Let’s edit the file deployment.yaml inside the templates directory to look like:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "hello-world.fullname" . }}
  labels:
    app.kubernetes.io/name: {{ include "hello-world.name" . }}
    helm.sh/chart: {{ include "hello-world.chart" . }}
    app.kubernetes.io/instance: {{ .Release.Name }}
    app.kubernetes.io/managed-by: {{ .Release.Service }}
spec:
  replicas: {{ .Values.replicaCount }}
  selector:
    matchLabels:
      app.kubernetes.io/name: {{ include "hello-world.name" . }}
      app.kubernetes.io/instance: {{ .Release.Name }}
  template:
    metadata:
      labels:
        app.kubernetes.io/name: {{ include "hello-world.name" . }}
        app.kubernetes.io/instance: {{ .Release.Name }}
    spec:
      containers:
        - name: {{ .Chart.Name }}
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          ports:
            - name: http
              containerPort: 8080
              protocol: TCP
```

Edit the service.yaml

```yaml
apiVersion: v1
kind: Service
metadata:
  name: {{ include "hello-world.fullname" . }}
  labels:
    app.kubernetes.io/name: {{ include "hello-world.name" . }}
    helm.sh/chart: {{ include "hello-world.chart" . }}
    app.kubernetes.io/instance: {{ .Release.Name }}
    app.kubernetes.io/managed-by: {{ .Release.Service }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  selector:
    app.kubernetes.io/name: {{ include "hello-world.name" . }}
    app.kubernetes.io/instance: {{ .Release.Name }}
```

Now, with our knowledge of Kubernetes, these template files look quite familiar except for some oddities. Note the liberal usage of text within double parentheses {{}}. This is what is called a template directive.

Helm makes use of the Go template language and extends that to something called Helm template language. During the evaluation, every file inside the template directory is submitted to the template rendering engine. This is where the template directive injects actual values into the templates.

## Providing Values

In the previous sub-section, we saw how to use the template directive in our templates. Now, let’s understand how we can pass values to the template rendering engine. We typically pass values through Built-in Objects in Helm.

There are many such objects available in Helm, like Release, Values, Chart, and Files.

We can use the file values.yaml in our chart to pass values to the template rendering engine through the Built-in Object Values. Let’s modify the values.yaml to look like:

```yaml
replicaCount: 1
image:
  repository: "hello-world"
  tag: "1.0"
  pullPolicy: IfNotPresent
service:
  type: NodePort
  port: 80
  
```

However, note how these values have been accessed within templates using dots separating namespaces. We have used the image repository and tag as “hello-world” and “1.0”, this must match the docker image tag we created for our Spring Boot application.

## Managing Charts

With everything done so far, we’re now ready to play with our chart. Let’s see what the different commands available in Helm CLI to make this fun are! Please note that we’ll only cover some of the commands available in Helm.

## Helm Lint

Firstly, this is a simple command that takes the path to a chart and runs a battery of tests to ensure that the chart is well-formed:

```bash
helm lint ./hello-world
==> Linting ./hello-world
1 chart(s) linted, no failures
[INFO] Chart.yaml: icon is recommended
[ERROR] templates/: template: hello-world/templates/serviceaccount.yaml:1:14: executing "hello-world/templates/serviceaccount.yaml" at <.Values.serviceAccount.create>: nil pointer evaluating interface {}.create
```

The output displays the result of the linting with issues that it identifies.

## Helm Template
Also, we’ve this command to render the template locally for quick feedback:

```bash
helm template ./hello-world
---
# Source: hello-world/templates/service.yaml
apiVersion: v1
kind: Service
metadata:
  name: release-name-hello-world
  labels:
    app.kubernetes.io/name: hello-world
    helm.sh/chart: hello-world-0.1.0
    app.kubernetes.io/instance: release-name
    app.kubernetes.io/managed-by: Tiller
spec:
  type: NodePort
  ports:
    - port: 80
      targetPort: http
      protocol: TCP
      name: http
  selector:
    app.kubernetes.io/name: hello-world
    app.kubernetes.io/instance: release-name

---
# Source: hello-world/templates/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: release-name-hello-world
  labels:
    app.kubernetes.io/name: hello-world
    helm.sh/chart: hello-world-0.1.0
    app.kubernetes.io/instance: release-name
    app.kubernetes.io/managed-by: Tiller
spec:
  replicas: 1
  selector:
    matchLabels:
      app.kubernetes.io/name: hello-world
      app.kubernetes.io/instance: release-name
  template:
    metadata:
      labels:
        app.kubernetes.io/name: hello-world
        app.kubernetes.io/instance: release-name
    spec:
      containers:
        - name: hello-world
          image: "hello-world:1.0"
          imagePullPolicy: IfNotPresent
          ports:
            - name: http
              containerPort: 8080
              protocol: TCP

```

## Helm Install

Once we’ve verified the chart to be fine, finally, we can run this command to install the chart into the Kubernetes cluster:

```bash
helm install --name hello-world ./hello-world
NAME:   hello-world
LAST DEPLOYED: Mon Feb 25 15:29:59 2019
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1/Service
NAME         TYPE      CLUSTER-IP     EXTERNAL-IP  PORT(S)       AGE
hello-world  NodePort  10.110.63.169  <none>       80:30439/TCP  1s

==> v1/Deployment
NAME         DESIRED  CURRENT  UP-TO-DATE  AVAILABLE  AGE
hello-world  1        0        0           0          1s

==> v1/Pod(related)
NAME                          READY  STATUS   RESTARTS  AGE
hello-world-7758b9cdf8-cs798  0/1    Pending  0         0s
```

This command also provides several options to override the values in a chart. Note that we’ve named the release of this chart with the flag –name. The command responds with the summary of Kubernetes resources created in the process.

## Helm Get

Now, we would like to see which charts are installed as what release. This command lets us query the named releases:

```bash
helm ls --all
NAME            REVISION        UPDATED                         STATUS          CHART               APP VERSION NAMESPACE
hello-world     1               Mon Feb 25 15:29:59 2019        DEPLOYED        hello-world-0.1.0   1.0         default
```

There are several sub-commands available for this command to get the extended information. These include All, Hooks, Manifest, Notes, and Values.

## Helm Upgrade

What if we’ve modified our chart and need to install the updated version? This command helps us to upgrade a release to a specified or current version of the chart or configuration:

```bash
helm upgrade hello-world ./hello-world
Release "hello-world" has been upgraded. Happy Helming!
LAST DEPLOYED: Mon Feb 25 15:36:04 2019
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1/Service
NAME         TYPE      CLUSTER-IP     EXTERNAL-IP  PORT(S)       AGE
hello-world  NodePort  10.110.63.169  <none>       80:30439/TCP  6m5s

==> v1/Deployment
NAME         DESIRED  CURRENT  UP-TO-DATE  AVAILABLE  AGE
hello-world  1        1        1           1          6m5s

==> v1/Pod(related)
NAME                          READY  STATUS   RESTARTS  AGE
hello-world-7758b9cdf8-cs798  1/1    Running  0         6m4s
```

Please note that with Helm 3, the release upgrade uses a three-way strategic merge patch. Here, it considers the old manifest, cluster live state, and new when generating a patch. Helm 2 used a two-way strategic merge patch that discarded changes applied to the cluster outside of Helm.

Helm Rollback
It can always happen that a release went wrong and needs to be taken back. This is the command to roll back a release to the previous versions:

```bash
helm rollback hello-world 1
Rollback was a success! Happy Helming!
```

We can specify a specific version to roll back to or leave this argument black, in which case it rolls back to the previous version.

## Helm Uninstall

Although less likely, we may want to uninstall a release completely. We can use this command to uninstall a release from Kubernetes:

```bash
helm uninstall hello-world
release "hello-world" deleted
```

It removes all of the resources associated with the last release of the chart and the release history.

## Distributing Charts

While templating is a powerful tool that Helm brings to the world of managing Kubernetes resources, it’s not the only benefit of using Helm. As we saw in the previous section, Helm acts as a package manager for the Kubernetes application and makes installing, querying, upgrading, and deleting releases pretty seamless.

In addition to this, we can also use Helm to package, publish, and fetch Kubernetes applications as chart archives. We can also use the Helm CLI for this as it offers several commands to perform these activities. As before, we’ll not cover all the available commands.

Helm Package
Firstly, we need to package the charts we’ve created to be able to distribute them. This is the command to create a versioned archive file of the chart:

```bash
helm package ./hello-world
Successfully packaged chart and saved it to: \hello-world\hello-world-0.1.0.tgz
```

Note that it produces an archive on our machine that we can distribute manually or through public or private chart repositories. We also have an option to sign the chart archive.

Helm Repo
Finally, we need a mechanism to work with shared repositories to collaborate. There are several sub-commands available within this command that we can use to add, remove, update, list, or index chart repositories. Let’s see how we can use them.

We can create a git repository and use that to function as our chart repository. The only requirement is that it should have an index.yaml file.

We can create index.yaml for our chart repo:

```bash
helm repo index my-repo/ --url https://<username>.github.io/my-repo
```

This generates the index.yaml file, which we should push to the repository along with the chart archives.

After successfully creating the chart repository, subsequently, we can remotely add this repo:

```bash
helm repo add my-repo https://my-pages.github.io/my-repo
```

Now, we should be able to install the charts from our repo directly:

```bash
helm install my-repo/hello-world --name=hello-world
```

There are quite a several commands available to work with the chart repositories.


## Helm Search

Finally, we should search for a keyword within a chart that can be present on any public or private chart repositories.

```bash
helm search repo <KEYWORD>
```

There are sub-commands available for this command that allows us to search different locations for charts. For instance, we can search for charts in the Artifact Hub or our own repositories. Further, we can search for a keyword in the charts available in all the repositories we’ve configured.



