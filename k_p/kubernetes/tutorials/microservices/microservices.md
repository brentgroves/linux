# Microservices

## What are microservices?

Microservices - also known as the microservice architecture - is an architectural style that structures an application as a collection of services that are:

Independently deployable
Loosely coupled
Organized around business capabilities
Owned by a small team

![](https://microservices.io/i/posts/microservices-teams-subdomains.png)

## Designing

Picking technologies - Kubernetes, message broker etc - is important

But what’s critically important is designing a good service architecture: identifying services; defining their responsibilities; their APIs and collaborations. If you get it wrong you risk creating a distributed monolith, which will slow down software delivery.

What’s more, designing the service architecture is challenging because it’s a creative activity - not something you can buy, download or read in a manual.

**[Assemblage](https://microservices.io/post/architecture/2023/02/09/assemblage-architecture-definition-process.html)** is an architecture definition process that you can can use to define your microservice architecture. It distills your requirements into system operations and subdomains; uses the **[dark energy and dark matter forces](https://microservices.io/post/microservices/2021/11/30/dark-matter-dark-energy.html)** to group the subdomains into services; and designs the distributed system operations.

![](https://microservices.io/i/posts/assemblage-overview/Defining_Microservice_Architecture_V2.png)

Assemblage works in conjunction with the **[Microservice architecture pattern language](https://microservices.io/patterns)**, which is your guide when designing a technical architecture

![](https://microservices.io/i/MicroservicePatternLanguage.jpg)

After defining a target microservice architecture you then need to refactor your existing monolith.
