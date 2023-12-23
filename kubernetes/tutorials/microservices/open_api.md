# Open API

## references

<https://swagger.io/blog/consistent-kubernetes-microservices-with-openapi/>

## What Is OpenAPI?

The OpenAPI Specification (OAS), formerly known as the Swagger specification, defines a standard, language-agnostic interface to HTTP-based APIs. The OAS allows humans and computers to understand the capabilities of the service without access to source code, documentation, or network traffic inspection.

API specifications like OpenAPI do more than document what an API looks like. A consumer can understand and interact with the remote service with a minimal amount of implementation logic. The same is true on the provider side of an API, as stakeholders can communicate more effectively on the value proposition offered by any service.

![](https://static1.smartbear.co/swagger/media/blog/api-life-cycle.png)

Using an API definition can help automate many stops along the API lifecycle, including client and server code generation, mocking an API’s implementation, test automation, and telling the story of the API. This automation potential reduces waste from the DevOps cycles on both the producer and consumer sides of the API.

## APIs and Microservices – What’s the Difference?

The terms are often used interchangeably, but they aren’t the same.

API stands for Application Program Interface. An API is an interface to a service, capability, or data. The programmable interface facilitates connections and communication between software applications and components, while hiding the implementation details. APIs are the language of software.

Microservices are all about implementation. A microservices architecture is an implementation pattern which promotes the delivery of self-contained components. These can be updated and evolved independently. APIs can exist without microservices! Most organizations don’t have the luxury of starting from scratch, so their API strategy includes the evolution from monolith to microservices approaches for API delivery.

![](https://static1.smartbear.co/swagger/media/blog/microservices-evolution.png)

**[Microservices](https://smartbear.com/state-of-software-quality/api/challenges-and-future/#future-technologies)** are a major catalyst for the rise in API numbers.

## What Is Kubernetes?

Kubernetes, also known as K8s, is a portable, extensible, and open-source platform for managing containerized workflows and services. It groups the containers that make up an application, using the concept of “pods” and “labels,” into logical units for ease of management and discovery.

![](https://static1.smartbear.co/swagger/media/blog/kubernetes-architecture.png)

Figure 3 – Kubernetes architecture (containers in grey, pods in color), © Google Inc

Kubernetes was developed by Google, which donated it to the Cloud Native Computing Foundation (CNCF).

## What Is an API Gateway?

An API gateway is a component used as part of an API management strategy. It acts as a front door to your API estate. Gateways intercept request and response traffic between clients and an API, and execute many common activities. The exact functionality varies, but routing, mapping, rate-limiting, authentication, transformation, validation, analytics, and billing are all possible.

## What Is Ingress and Ingress Controllers?

Typically, services and pods have IPs which are only routable by the internal cluster network. All traffic that ends up at an edge router is either dropped or forwarded elsewhere.

Kubernetes Ingress is an API object that describes the external access routing rules for incoming traffic (typically HTTP or HTTPS) into the services running within a Kubernetes cluster. Ingress was created to make it easy for external clients (residing outside of a cluster) to access an application within the cluster, via a stable and externally addressable URL.

![](https://static1.smartbear.co/swagger/media/blog/simple-ingress.png)

Figure 4 – Simple Ingress – ©Kubernetes.io

An Ingress Controller provides the actual Ingress implementation, and a running controller is required for the Ingress resource to work. Ingress controllers are pods, just like any other application in the cluster, and can see other pods. The controllers can inspect the incoming requests and perform certain rule fulfillment, like routing, as specified in the Ingress manifest. Ingress controllers resemble API Gateways.

## The Cloud Makes API Standards Necessary – and Tricky

Industry research shows that standardization, governance, and security are significant challenges. With the adoption of cloud native environments, enforcing standardization of the operational aspect of API product is equally important to functional elements for the guaranteeing overall developer experience while keeping oversight across a distributed organizational landscape. It can lead to an exceptional developer experience while maintaining oversight across a distributed organizational landscape.

SmartBear recently teamed up with our friends at Kubeshop to showcase how combining SwaggerHub and Kusk promotes a single source of truth for your APIs.

Enabling fast, collaborative, and standardized API design is what SwaggerHub does best. It makes compliance with OpenAPI and your organization custom rules (or style guide) simple and intuitive. Combining SwaggerHub and the x-kusk extension from Kubeshop gives teams a single source of truth for operating and managing access to APIs running in Kubernetes.

The x-kusk extension supports declaring various run-time specifics of an API directly with an OpenAPI definition, in a unified manner agnostic of the cluster technology chosen.

It’s possible to specify the following directly with the definitions:

Timeouts / retries
CORS
Disabling paths / operations (e.g., hide admin paths before exposing externally)
Mocking
Validation
Cluster-specific properties
