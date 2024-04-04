# Storage Types

There are several storage solutions I would recommend Object based storage.

- File storage
- Block Storage
- Plex managed
- Object based

## S3 Compatible

## File storage

File storage provides a file system and a network protocol. File system could be NTFS and the network protocol could be SMB. Similar to what a Windows or Linux file server does.

- No special storage device needed just the computer

## Block storage

Block storage is usually connected via **[SAN](https://www.netapp.com/data-storage/what-is-san-storage-area-network/#:~:text=By%20storing%20data%20in%20centralized,logical%20disk%20units%20(LUNs).)** protocols like iSCSI or Fibre Channel.

Storage area networks (SANs) are the most common storage networking architecture used by enterprises for business-critical applications that need to deliver high throughput and low latency.

SANs make up about two-thirds of the total networked storage market. They are designed to remove single points of failure, making SANs highly available and resilient. A well-designed SAN can easily withstand multiple component or device failures.

## Plex storage

- Just need the rights to Plex to use
- We don't manage it but pay for it to be managed
- Maybe not as flexible since we are working under the constraints of the ERP.

## Object storage

- can be managed locally at no cost with **[](https://min.io/)**
- just upload your files and download them from anywhere
- can be managed through our cloud provider with **[Azure storage](https://azure.microsoft.com/en-us/products/storage/blobs)**

Benefits of **[Azure Storage](https://learn.microsoft.com/en-us/azure/storage/common/storage-introduction)**

Azure Storage services offer the following benefits for application developers and IT professionals:

- Durable and highly available. Redundancy ensures that your data is safe in the event of transient hardware failures. You can also opt to replicate data across data centers or geographical regions for additional protection from local catastrophe or natural disaster. Data replicated in this way remains highly available in the event of an unexpected outage.
- Secure. All data written to an Azure storage account is encrypted by the service. Azure Storage provides you with fine-grained control over who has access to your data.
- Scalable. Azure Storage is designed to be massively scalable to meet the data storage and performance needs of today's applications.
Managed. Azure handles hardware maintenance, updates, and critical issues for you.
- Accessible. Data in Azure Storage is accessible from anywhere in the world over HTTP or HTTPS. Microsoft provides client libraries for Azure Storage in a variety of languages, including .NET, Java, Node.js, Python, PHP, Ruby, Go, and others, as well as a mature REST API. Azure Storage supports scripting in Azure PowerShell or Azure CLI. And the Azure portal and Azure Storage Explorer offer easy visual solutions for working with your data.

<https://www.scality.com/topics/s3-compatible-storage/>

## When should I start using object storage?
