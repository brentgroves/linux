# Azure SQL Server

## references

<https://learn.microsoft.com/en-us/azure/azure-sql/database/firewall-configure?view=azuresql>

## Troubleshoot the database firewall

Cannot open server 'mgsqlserver' requested by the login. Client with IP address '64.184.36.240' is not allowed to access the server.  To enable access, use the Azure Management Portal or run sp_set_firewall_rule on the master database to create a firewall rule for this IP address or address range.  It may take up to five minutes for this change to take effect. ClientConnectionId:6d70a9f9-4ded-485c-ba70-14a9b70fd646
Cannot open server 'mgsqlserver' requested by the login. Client with IP address '64.184.36.240' is not allowed to access the server.  To enable access, use the Azure Management Portal or run sp_set_firewall_rule on the master database to create a firewall rule for this IP address or address range.  It may take up to five minutes for this change to take effect. ClientConnectionId:6d70a9f9-4ded-485c-ba70-14a9b70fd646

Consider the following points when access to Azure SQL Database doesn't behave as you expect.

Local firewall configuration:

Before your computer can access Azure SQL Database, you may need to create a firewall exception on your computer for TCP port 1433. To make connections inside the Azure cloud boundary, you may have to open additional ports. For more information, see the "SQL Database: Outside vs inside" section of Ports beyond 1433 for ADO.NET 4.5 and Azure SQL Database.

## Network address translation

Because of network address translation (NAT), the IP address that's used by your computer to connect to Azure SQL Database may be different than the IP address in your computer's IP configuration settings. To view the IP address that your computer is using to connect to Azure:

- Sign in to the portal.
- Go to the Configure tab on the server that hosts your database.
- The Current Client IP Address is displayed in the Allowed IP Addresses section. - - Select Add for Allowed IP Addresses to allow this computer to access the server.
