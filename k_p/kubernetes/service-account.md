# Service Account

## references

<https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/>

## Configure Service Accounts for Pods

Kubernetes offers two distinct ways for clients that run within your cluster, or that otherwise have a relationship to your cluster's control plane to authenticate to the API server.

A service account provides an identity for processes that run in a Pod, and maps to a ServiceAccount object. When you authenticate to the API server, you identify yourself as a particular user. Kubernetes recognises the concept of a user, however, Kubernetes itself does not have a User API.

This task guide is about ServiceAccounts, which do exist in the Kubernetes API. The guide shows you some ways to configure ServiceAccounts for Pods.

## Use the default service account to access the API server

When Pods contact the API server, Pods authenticate as a particular ServiceAccount (for example, default). There is always at least one ServiceAccount in each namespace.

Use the default service account to access the API server
When Pods contact the API server, Pods authenticate as a particular ServiceAccount (for example, default). There is always at least one ServiceAccount in each namespace.

Every Kubernetes namespace contains at least one ServiceAccount: the default ServiceAccount for that namespace, named default. If you do not specify a ServiceAccount when you create a Pod, Kubernetes automatically assigns the ServiceAccount named default in that namespace.

You can fetch the details for a Pod you have created. For example:

```bash
kubectl get pods/<podname> -o yaml
```

In the output, you see a field spec.serviceAccountName. Kubernetes automatically sets that value if you don't specify it when you create a Pod.

An application running inside a Pod can access the Kubernetes API using automatically mounted service account credentials. See accessing the Cluster to learn more.

When a Pod authenticates as a ServiceAccount, its level of access depends on the authorization plugin and policy in use.
