# Azure SQL Server Managed Instance

## references

<https://intercept.cloud/en/news/azure-sql-sql-managed-instance-or-sql-server/>

## Azure SQL

Azure SQL is a robust cloud-based service (PaaS) that shares many features with on-premises SQL Server. This solution offers exceptional scalability and high availability out of the box, making it an ideal choice for modernizing your applications. Leveraging Azure's infrastructure, you can seamlessly scale your databases to meet growing demands. Additionally, Azure SQL enables geo-replication, simplifying the deployment and management of databases across regions. Compliance requirements are addressed with features like Azure SQL Auditing and Transparent Data Encryption;

## SQL Managed instance

Azure SQL Managed Instance is a fully managed database service that provides nearly 100% compatibility with the latest SQL Server (Enterprise Edition) database engine. It combines the benefits of both PaaS and traditional SQL Servers, offering a seamless migration path for applications dependent on SQL Server features. With SQL Managed Instance, you can take advantage of high-performance computing and comprehensive database capabilities while reducing administrative overhead. Considering resource limits when opting for this option is crucial to ensure optimal performance.

Chose this partly because of SSIS scripts.

## SQL Server

Azure fully supports running SQL Server on Infrastructure as a Service (IaaS) virtual machines (VMs). By leveraging Azure VMs, you gain complete control over the operating system and can maintain compatibility with on-premises workloads, including SQL Server Reporting Services. To ensure high availability, it is recommended to utilize Always On availability groups, guaranteeing continuous database accessibility. Regular patching of the VMs is essential, and Cluster-Aware Updating is advised for streamlined updates.
