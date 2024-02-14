
# **[Service tiers](https://blog.devart.com/what-is-azure-sql.html)**

Azure SQL Database offers several service tiers to target different workloads: Basic, Standard (General Purpose), Premium (Business Critical), and HyperScale. They all grant you appropriate performance, security, and business continuity.

- The Basic service tier is the simplest option that supports one active operation at a time. It usually suits databases for small and rarely used applications. We won’t pay close attention to it and proceed to more popular service tiers
- The Standard (General Purpose) service tier is a default option for both the Database and Managed Instance in Azure SQL. The Standard service tier can be used by most cloud apps perfectly. The storage size varies from 1GB to 4TB and Azure takes care of all upgrades and patching
- The Premium (Business Critical) service tier is designed for powerful applications that demand low-latency responses, fast recovery in case of any infrastructure failures, analyzing data loads, etc. If an application is critical for your business, you should go with the Premium service tier. The storage size is the same as for the General Purpose service tier – from 1Gb to 4 TB
- The Hyperscale service tier is a new option that is present in the vCore model only. It offers much more scalable storage with significantly more power for computing, more than in any other service tier. The size of a database can be up to 100 TB in the Hyperscale service tier and databases don’t have a definite maximal size initially. It grows when you need it. Backups and restores are performed much faster and the overall performance is much higher, no matter which data volumes it operates

<!-- https://azure.microsoft.com/en-us/pricing/details/azure-sql-database/single/ -->
# Announcing New Lower Price Tier for Cloud Native Applications on Azure SQL

Today we are announcing a new pricing tier for Azure SQL Database targeted at developers building cloud native applications. It is based on Azure SQL Database Hyperscale tier, which offers awesome cloud scalability with one of the lowest TCO in the industry. Azure SQL Database Hyperscale delivers outstanding performance and scalability through adaptive, cloud native resource management, optimized for the workload patterns of each database application. Hyperscale storage scales automatically, providing consistent performance at all scales. Azure SQL Database Hyperscale provides the best database capabilities to build cloud native applications, including abilities to create APIs for your database using Data API builder, calling external endpoints, integrating with Azure functions, and more.

## references

<https://devblogs.microsoft.com/azure-sql/announcing-new-lower-price-tier-for-cloud-native-applications-on-azure-sql/>

## Market Leading Database Capabilities

Azure SQL Database Hyperscale brings three decades of SQL innovation to developers, along with the cloud scale and the latest AI capabilities. Some salient features that differentiate SQL Hyperscale database layer from the competition include:

Storage snapshot capability in Hyperscale provides fast backup and restore, that meets the aggressive requirements of cloud native workloads. Support for 30 Named Replicas allowing different compute sizes than the primary for each replica is not offered in any other cloud database service. This is a huge advantage for highly transactional and read-scalable workloads both in terms of performance as well as cost.
Named replicas in conjunction with the support for three types of secondary replicas i.e. Read Scale-Out, HA and Geo Replication make Hyperscale even more unique and differentiated.
Rapid & predictable scale up/down capability – Uniquely helps developers meet aggressive operations and sustain SLA requirements for highly scalable very large database (VLDB) systems.
Independent of database size, the Premium & Memory Optimized SKUs of Hyperscale uniquely positions it to better handle higher throughput & lower latency (using RBPEX caching) transactional workloads i.e., Hyperscale database can handle 300K+ IOPS with 128 vCores.
Growing trend of ISVs wanting to leverage SQL Database Hyperscale elastic pool capability that allows them to package many databases into an elastic pool, enabling them to optimize price-performance and database operations.

## Azure SQL Performance and Reliability at Open-source Prices

Azure SQL will continue to provide database tiers that offer the best TCO for customers migrating and modernizing. In addition to the existing SQL tiers, today we are announcing a new pricing tier for Azure SQL Database Hyperscale. We are reducing the price of compute by up to 35%. Now, with Azure SQL Database Hyperscale, anyone can avail the same rich functionality of Azure SQL, at much lower compute price, giving customers the best of both worlds – highest grade database capabilities of Azure SQL at a cost commonly associated with open-source databases, enabling customers to do more with less. Azure SQL Database Hyperscale comes with high performance, auto-scalable and multi-cache database storage, at a very competitive price. Customers have indicated to us that they love the predictable pricing model of Azure SQL Database. Azure SQL Database does not charge for database IO in any tier, including Azure SQL Database Hyperscale. You only pay for your database vCores and the storage usage, making it easy to predict your database spend up front. This accompanying blog post has more details on the new pricing.

For workloads with intermittent, unpredictable or bursty usage patterns, Azure SQL Database Hyperscale also supports serverless capability that automatically scales compute based on workload demand and bills for usage. For building multi-tenant SaaS applications, Azure SQL Database Hyperscale enables the elastic pools capability.

In summary, whether you are building a database application with 10 GB of data or 100 TB of data, for one user or millions of users, Azure SQL Database Hyperscale provides the database with industry’s best price-performance, scalability, security, and extensibility.
