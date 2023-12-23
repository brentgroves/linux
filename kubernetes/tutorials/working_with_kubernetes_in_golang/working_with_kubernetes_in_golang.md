# Working with kubernetes in GoLang

A tutorial on how to work with Kubernetes using Golang.

## references

<https://medium.com/cloud-native-daily/working-with-kubernetes-using-golang-a3069d51dfd6>
<https://developers.redhat.com/blog/2020/12/16/create-a-kubernetes-operator-in-golang-to-automatically-manage-a-simple-stateful-application>

## k8s

![](https://miro.medium.com/v2/resize:fit:720/format:webp/0*7mhKLw0_8v0HVyXT)

These days Kubernetes is gaining popularity, as it is the best choice for deploying large-scale microservice applications. Kubernetes is the orchestration platform for containers.

The 3 main advantages of using Kubernetes are High Availability, high scalable and Disaster Recovery. These are typical requirements for large-scale microservices applications. There are a lot of blogs, YouTube videos and documentation which describe its usage. In this article, I will briefly go over how we can interact with Golang.

## Creating Simple Kubernetes ClientSet

All the K8s resources can be accessed using the client set. In Go, we can generate two types of clientsets. Normal client set and dynamic client set. The normal clientset is generated from the Kubernetes API Swagger specification. It provides a strongly typed API with methods specific to each resource type, enabling easy and type-safe interaction with the API. However, it requires pre-defined client objects for each resource type.
The dynamic client set offers a more flexible and dynamic way to interact with the Kubernetes API. It provides a lower-level interface that allows you to interact with the API using dynamic objects and unstructured data.
The following code shows how to create the client set.
