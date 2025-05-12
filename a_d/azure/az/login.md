# **[login](https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli-interactively?view=azure-cli-latest)**

Interactive logins to Azure offer a more intuitive and flexible user experience. With Azure CLI, you can authenticate to Azure directly through the az login command. This command is useful for ad-hoc management tasks and for environments that require manual sign-in, such as scenarios with multifactor authentication (MFA). This method simplifies access for script testing, learning, and on-the-fly management without needing to preconfigure service principals or other noninteractive authentication methods.

 Important

Starting in 2025, Microsoft will enforce mandatory MFA for Azure CLI and other command-line tools. MFA will only impact Microsoft Entra ID user identities. It will not impact workload identities, such as service principals and managed identities.

If you are using az login with an Entra ID and password to authenticate a script or automated process, plan now to migrate to a workload identity. For more information, see The **[impact of multifactor authentication on Azure CLI in automation scenarios](https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli-mfa?view=azure-cli-latest)**.

Log in interactively.

Azure CLI

`az login`
