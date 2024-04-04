# CRD in GoLang

## references

<https://medium.com/cloud-native-daily/kubernetes-crd-handling-in-go-d426e9c3c1ab>

## CRD

![](https://miro.medium.com/v2/resize:fit:720/format:webp/0*JDZapAe4iXIa3WB0.png)

Kubernetes CRD (Custom Resource Definitions) allows users to define their own resources, just like Deployment, Pods, etc. And using kubectl we should be able to do all the operations that we normally do for existing universal K8s resources. These CRDs will have their own Name, schema and GroupVersion, but one condition is that the name of the CRD object should follow **[dns-sub-domain-names](https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#dns-subdomain-names)**.

DNS Subdomain Names
Most resource types require a name that can be used as a DNS subdomain name as defined in RFC 1123. This means the name must:

contain no more than 253 characters
contain only lowercase alphanumeric characters, '-' or '.'
start with an alphanumeric character
end with an alphanumeric character

There is also another concept called **[Aggregated APIs](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/)** where you can add your custom resources, But this blog only focuses on CRD.

Points to be noted while using CRD:

1. CRDs use the same type of Authentication and Authorization as that of inbuilt resources. But in the RBAC, you have to define explicitly as it would be present in any apps/v1 or core/v1 groups

2. No additional service is required to run; CRDs are handled by Kubernetes API server itself.

Creating CRD is also very simple. Just like how you deploy the Deployment or Pod , you would be able to create CRD. There will be a YAML file which defines the CRD functionalities.

```yaml
apiVersion: "setup.example.com/crd"
kind: MyCRD
metadata:
  name: my-custom-crd
spec:
  image: my-custom-crd-image
```

Once you deploy this using kubectl apply -f crd-template.yaml , you would be able to perform any kubectl operation, like kubectl get mycrd.

Golang is the popular language for backend development. It provides Kubernetes clients to interact with the Kubernetes server. The basic interaction, creating various types of client and others are covered in Working with Kubernetes using Golang. In this article, I will cover Golang code where you add all the existing CRD present in the cluster to your schema along with in-built Kubernetes resources.
