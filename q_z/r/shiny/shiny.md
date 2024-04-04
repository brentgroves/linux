# Shiny

## references

<https://docs.posit.co/shiny-server/#application-error-logs>

## Getting Started

1.1 Introduction
Shiny Server enables users to host and manage Shiny applications on the Internet. Shiny is an R package that uses a reactive programming model to simplify the development of R-powered web applications. Shiny Server can manage R processes running various Shiny applications over different URLs and ports. Using Shiny Server offers a variety of benefits over simply running Shiny in R directly. These features allow the administrator to:

Host multiple applications simultaneously, each at its own URL.
Support web browsers that don't support WebSocket, including Internet Explorer 8 & 9.
Enable system users to develop and manage their own Shiny applications.
Ensure that R processes that crash or are terminated automatically restart for the next user requesting the application.
PRO
This manual describes Shiny Server Professional, which offers, among other things, the following additional features:

Ensure your applications are protected and can only be accessed by specific, authenticated users.
Scale a Shiny application to support many users by empowering a Shiny application to be backed by multiple R Shiny processes simultaneously.
Gain insight into the performance and usage of your Shiny applications by monitoring them using a web dashboard.
Securely encrypt data being sent to and from your applications using SSL.
Understand and manage current and historical application resource utilization to better configure and optimize your applications.
Fine-tune the resources devoted to each user of an application by configuring multi-process Shiny applications based on the number of concurrent sessions.
Monitor the health of your Shiny Server using the health check endpoint.
