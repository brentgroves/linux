# GitOps

## references

<https://about.gitlab.com/topics/gitops/>

## What is GitOps?

GitOps is an operational framework that takes DevOps best practices used for application development such as version control, collaboration, compliance, and CI/CD, and applies them to infrastructure automation.

Download the GitOps Ebook Now

What is GitOps?
While much of the software development lifecycle has been automated, infrastructure has remained a largely manual process that requires specialized teams. With the demands made on today’s infrastructure, it has become increasingly crucial to implement infrastructure automation. Modern infrastructure needs to be elastic so that it can effectively manage cloud resources that are needed for continuous deployments.

Modern and cloud native applications are developed with speed and scale in mind. Organizations with a mature DevOps culture can deploy code to production hundreds of times per day. DevOps teams can accomplish this through development best practices such as version control, code review, and CI/CD pipelines that automate testing and deployments.

GitOps is used to automate the process of provisioning infrastructure, especially modern cloud infrastructure. Similar to how teams use application source code, operations teams that adopt GitOps use configuration files stored as code (infrastructure as code). GitOps configuration files generate the same infrastructure environment every time it’s deployed, just as application source code generates the same application binaries every time it’s built.

GitOps is not a single product, plugin, or platform. There is no one-size-fits-all answer to this question, as the best way for teams to put GitOps into practice will vary depending on the specific needs and goals of the team. However, some tips on how to get started with GitOps include using a dedicated GitOps repository for all team members to share configurations and code, automating the deployment of code changes, and setting up alerts to notify the team when changes occur.

GitOps requires three core components:

IaC:
GitOps uses a Git repository as the single source of truth for infrastructure definitions. Git is an open source version control system that tracks code management changes, and a Git repository is a .git folder in a project that tracks all changes made to files in a project over time. Infrastructure as code (IaC) is the practice of keeping all infrastructure configuration stored as code. The actual desired state may or may not be not stored as code (e.g., number of replicas or pods).

MRs:
GitOps uses merge requests (MRs) or pull requests (PRs) as the change mechanism for all infrastructure updates. The MR or PR is where teams can collaborate via reviews and comments and where formal approvals take place. A merge commits to your main (or trunk) branch and serves as an audit log or audit trail.

CI/CD:
GitOps automates infrastructure updates using a Git workflow with continuous integration and continuous delivery (CI/CD). When new code is merged, the CI/CD pipeline enacts the change in the environment. Any configuration drift, such as manual changes or errors, is overwritten by GitOps automation so the environment converges on the desired state defined in Git. GitLab uses CI/CD pipelines to manage and implement GitOps automation, but other forms of automation, such as definitions operators, can be used as well.

## GitOps Support

Here are some of the key GitOps features provided by Kong:

1. Declarative Configuration: Kong provides a declarative configuration approach to defining the desired state of the API Gateway, which can be version-controlled and managed using Git. This makes it easy to manage and track changes to the configuration of the API Gateway over time.
2. GitOps Operator: Kong provides a GitOps operator that can be used to manage the deployment and configuration of the Kong API Gateway on Kubernetes. The operator monitors the Git repository for changes to the configuration and automatically applies them to the API Gateway.
3. Continuous Delivery Pipeline: Kong provides integration with popular continuous delivery tools such as Jenkins and GitLab, allowing developers to automatically deploy and configure the Kong API Gateway as part of their application deployment pipeline.
4. Rollback and Rollout: Kong’s GitOps support includes rollback and rollout functionality, allowing developers to easily revert to previous versions of the API Gateway configuration in case of issues or errors.
5. Collaboration: Kong’s GitOps support enables collaboration between teams, making it easy to manage and track changes to the configuration of the API Gateway across multiple environments and teams.

## Kong Observability

Kong provides several observability features that can be used to monitor and analyze the performance of the Kong API Gateway when deployed on Kubernetes. Here are some of the key observability features provided by Kong:

1. Metrics: Kong exposes a range of metrics that can be used to monitor the performance of the API Gateway. These metrics can be accessed via Prometheus or other monitoring solutions, and include information such as request rate, latency, and error rates.
2. Tracing: Kong supports distributed tracing using tools such as Jaeger and Zipkin. This enables developers to trace requests through the entire request lifecycle, from the client to the backend service, and identify any performance issues or errors.
3. Logging: Kong provides detailed logs that can be used to troubleshoot issues and gain insights into API traffic. These logs can be sent to centralized logging solutions such as Elasticsearch, Splunk, or Logstash.
4. Alerting: Kong supports alerting based on metrics and logs. Developers can configure alerts to notify them when certain metrics or events occur, such as when the error rate exceeds a certain threshold.
5. Dashboard: Kong provides a built-in dashboard that displays key metrics and information about the API Gateway, such as request rate, latency, and error rates. This can be used to quickly identify performance issues and gain insights into API traffic.
6. Custom plugins: Kong provides a plugin architecture that allows developers to create custom plugins to collect and analyze observability data. This enables developers to create custom metrics, logs, and dashboards to gain deeper insights into API traffic.
